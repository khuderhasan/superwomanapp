import '../../config/result_class.dart';
import '../datasourse/woman_datasource.dart';
import '../model/menstrual_model.dart';

class WomanRepository {
  final WomanDatasource _datasource;

  WomanRepository({required WomanDatasource datasource})
      : _datasource = datasource;
  Future<ResponseState<MenstrualModel>> getMenstrualInfo() async {
    final response = await _datasource.getMenstrualInfo();
    return response;
  }

  Future<ResponseState<bool>> setMenstrualInfo(
      {required menstrualDate, required cycleLength}) async {
    final response = await _datasource.setMenstrualInfo(
        menstrualDate: menstrualDate, cycleLength: cycleLength);
    return response;
  }

  Future<ResponseState<DateTime>> setPregnancyStartDate(
      {required pregnancyStartDate}) async {
    final response = await _datasource.setPregnencyDate(
        pregnencyStartDate: pregnancyStartDate);
    return response;
  }
}
