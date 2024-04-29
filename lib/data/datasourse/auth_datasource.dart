import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_woman/config/auth_exception.dart';

import '../../config/error_model.dart';
import '../../config/result_class.dart';
import '../../util/prefrences_helper.dart';
import '../model/user_model.dart';

class AuthDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ResponseState<UserModel>> signUp({
    required firstName,
    required lastName,
    required email,
    required password,
    required accountType,
  }) async {
    try {
      String id = '';
      await _firestore.collection('users').add({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'accountStatus': 'pending',
        'accountType': accountType,
      }).then((docRef) {
        id = docRef.id;
        docRef.update({
          'id': docRef.id,
        });
      });

      final userData = UserModel(
          id: id,
          firstName: firstName,
          email: email,
          lastName: lastName,
          accountStatus: 'pending',
          accountType: accountType);
      await PrefHelper.saveUsersInfo(userData);
      return ResponseState.success(userData);
    } on FirebaseException catch (e) {
      return ResponseState.error(ErrorModel(code: e.code, message: e.message!));
    }
  }

  Future<ResponseState<UserModel>> signIn(
      {required email, required password}) async {
    try {
      UserModel? userData;
      await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get()
          .then((value) {
        if (value.docs.isEmpty) {
          throw const AuthException(code: "404", message: "المستخدم غير موجود");
        }

        userData = UserModel.fromMap(value.docs.first.data());
      });
      await PrefHelper.saveUsersInfo(userData!);
      return ResponseState.success(userData!);
    } on FirebaseException catch (e) {
      return ResponseState.error(ErrorModel(code: e.code, message: e.message!));
    } on AuthException catch (e) {
      return ResponseState.error(ErrorModel(code: e.code, message: e.message));
    }
  }

  Future<ResponseState<bool>> signOut() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
      return ResponseState.success(true);
    } on FirebaseException catch (e) {
      return ResponseState.error(ErrorModel(code: e.code, message: e.message!));
    }
  }
}
