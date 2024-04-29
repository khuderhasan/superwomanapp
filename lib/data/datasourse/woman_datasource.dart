import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../model/user_model.dart';
import '../../config/error_model.dart';
import '../../config/result_class.dart';
import '../model/menstrual_model.dart';
import '../../util/prefrences_helper.dart';

class WomanDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ResponseState<bool>> setMenstrualInfo(
      {required menstrualDate, required cycleLength}) async {
    final currentUser = await PrefHelper.getSavedInfo();
    try {
      await _firestore.collection('users').doc(currentUser.id).update({
        'menstrualDate': DateFormat('yyyy-MM-dd').format(menstrualDate),
        'cycleLength': cycleLength,
      });
      return ResponseState.success(true);
    } on FirebaseException catch (e) {
      return ResponseState.error(ErrorModel(code: e.code, message: e.message!));
    }
  }

  Future<ResponseState<MenstrualModel>> getMenstrualInfo() async {
    final currentUser = await PrefHelper.getSavedInfo();
    MenstrualModel menstrualInfo =
        MenstrualModel(cycleLength: null, menstrualDate: null);
    try {
      await _firestore
          .collection('users')
          .doc(currentUser.id)
          .get()
          .then((value) {
        menstrualInfo = MenstrualModel.fromMap(value.data()!);
      });
      return ResponseState.success(menstrualInfo);
    } on FirebaseException catch (e) {
      return ResponseState.error(ErrorModel(code: e.code, message: e.message!));
    }
  }

  Future<ResponseState<DateTime>> setPregnencyDate(
      {required pregnencyStartDate}) async {
    try {
      final currentUser = await PrefHelper.getSavedInfo();
      await _firestore.collection('users').doc(currentUser.id).update({
        'pregnencyStartDate':
            DateFormat('yyyy-MM-dd').format(pregnencyStartDate)
      });

      final newInfo = UserModel(
          id: currentUser.id,
          firstName: currentUser.firstName,
          email: currentUser.email,
          lastName: currentUser.lastName,
          accountType: currentUser.accountType,
          accountStatus: currentUser.accountStatus,
          pregnencyStartDate: pregnencyStartDate);
      await PrefHelper.saveUsersInfo(newInfo);
      return SuccessState(pregnencyStartDate);
    } on FirebaseException catch (e) {
      return ResponseState.error(ErrorModel(code: e.code, message: e.message!));
    }
  }
}
