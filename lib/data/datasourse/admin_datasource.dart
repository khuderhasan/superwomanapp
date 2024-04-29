import 'package:cloud_firestore/cloud_firestore.dart';

import '../../config/error_model.dart';
import '../../config/result_class.dart';
import '../model/user_model.dart';

class AdminDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ResponseState<List<UserModel>>> fetchUsers() async {
    List<UserModel> users = [];
    try {
      await _firestore.collection('users').get().then((value) {
        for (var element in value.docs) {
          users.add(UserModel.fromMap(element.data()));
        }
      });
      users.removeWhere((element) => element.accountType == 'admin');
      return ResponseState.success(users);
    } on FirebaseException catch (e) {
      return ResponseState.error(ErrorModel(code: e.code, message: e.message!));
    }
  }

  Future<ResponseState<bool>> acceptUser({required userId}) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .update({'accountStatus': 'accepted'});
      return ResponseState.success(true);
    } on FirebaseException catch (e) {
      return ResponseState.error(ErrorModel(code: e.code, message: e.message!));
    }
  }

  Future<ResponseState<bool>> deleteUser({required String userId}) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
      //delete user's chatrooms
      final QuerySnapshot<Map<String, dynamic>> results = await _firestore
          .collection('chat_rooms')
          .where('users', arrayContains: userId)
          .get();
      // Extract document IDs
      final List<String> documentIds =
          results.docs.map((doc) => doc.id).toList();
      // Delete documents in a loop
      for (final id in documentIds) {
        await _firestore.collection('chat_rooms').doc(id).delete();
      }
      return ResponseState.success(true);
    } on FirebaseException catch (e) {
      return ResponseState.error(ErrorModel(code: e.code, message: e.message!));
    }
  }
}
