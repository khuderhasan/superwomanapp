import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:super_woman/util/prefrences_helper.dart';

import '../../config/error_model.dart';
import '../../config/result_class.dart';
import '../model/doctor_model.dart';
import '../model/message_model.dart';
import '../model/user_model.dart';

class ChatDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ResponseState<List<DoctorModel>>> getDoctors() async {
    try {
      List<DoctorModel> doctors = [];
      await _firestore
          .collection('users')
          .where('accountType', isEqualTo: 'doctor')
          .get()
          .then((value) {
        for (var element in value.docs) {
          doctors.add(DoctorModel.fromMap(element.data()));
        }
      });
      return ResponseState.success(doctors);
    } on FirebaseException catch (e) {
      return ResponseState.error(ErrorModel(code: e.code, message: e.message!));
    }
  }

  Future<ResponseState<bool>> sendMessage(
      {required recieverId, required message}) async {
    try {
      final currentUser = await PrefHelper.getSavedInfo();
      final currentUserId = currentUser.id;
      final currentUserData = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserId)
          .get();
      MessageModel newMessage = MessageModel(
          senderId: currentUserId,
          senderName: currentUserData['firstName']!,
          recieverId: recieverId,
          message: message,
          createdAt: Timestamp.now());
      List<String> ids = [currentUserId, recieverId];
      ids.sort();
      String chatRoomId = ids.join('_');
      final List<String> users = [currentUserId, recieverId];

      await _firestore
          .collection('chat_rooms')
          .doc(chatRoomId)
          .set({'users': users});

      await _firestore
          .collection('chat_rooms')
          .doc(chatRoomId)
          .collection('messages')
          .add(newMessage.toMap());

      return ResponseState.success(true);
    } on FirebaseException catch (e) {
      return ResponseState.error(ErrorModel(code: e.code, message: e.message!));
    }
  }

  Stream<QuerySnapshot> getMessages(
      {required otherUserid, required currentUserId}) {
    List<String> ids = [currentUserId, otherUserid];
    ids.sort();
    String chatRoomId = ids.join('_');
    final collectionRefrence = _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('createdAt', descending: true);

    final snapshots = collectionRefrence.snapshots();
    return snapshots;
  }

  Future<ResponseState<List<UserModel>>> getRecentContacts() async {
    try {
      final currentUser = await PrefHelper.getSavedInfo();
      final currentUserId = currentUser.id;

      List<dynamic> usersIds = [];
      await _firestore
          .collection('chat_rooms')
          .where('users', arrayContains: currentUserId)
          .get()
          .then((value) {
        for (var element in value.docs) {
          for (var userId in element.data()['users']) {
            usersIds.add(userId);
          }
        }
      });
      usersIds.removeWhere((element) => element == currentUserId);

      List<UserModel> recentContacts = [];
      for (var userId in usersIds) {
        await _firestore.collection('users').doc(userId).get().then((value) {
          recentContacts.add(UserModel.fromMap(value.data()!));
        });
      }
      return ResponseState.success(recentContacts);
    } on FirebaseException catch (e) {
      return ResponseState.error(ErrorModel(code: e.code, message: e.message!));
    }
  }
}
