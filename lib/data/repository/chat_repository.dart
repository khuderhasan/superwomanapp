import '../../config/result_class.dart';
import '../datasourse/chat_datasource.dart';
import '../model/doctor_model.dart';
import '../model/user_model.dart';

class ChatRepository {
  final ChatDataSource _dataSource;

  ChatRepository({required ChatDataSource dataSource})
      : _dataSource = dataSource;
  Future<ResponseState<List<DoctorModel>>> getDoctors() async {
    final doctors = await _dataSource.getDoctors();
    return doctors;
  }

  Future<ResponseState> sendMessage(
      {required recieverId, required message}) async {
    final response =
        await _dataSource.sendMessage(recieverId: recieverId, message: message);
    return response;
  }

  Future<ResponseState<List<UserModel>>> getRecentContacts() async {
    final response = _dataSource.getRecentContacts();
    return response;
  }
}
