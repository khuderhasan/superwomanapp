import '../../config/result_class.dart';
import '../datasourse/admin_datasource.dart';
import '../model/user_model.dart';

class AdminRepository {
  final AdminDataSource _dataSource;

  AdminRepository({required AdminDataSource dataSource})
      : _dataSource = dataSource;

  Future<ResponseState<List<UserModel>>> fetchUsers() async {
    final response = _dataSource.fetchUsers();
    return response;
  }

  Future<ResponseState<bool>> acceptUser({required userId}) async {
    final response = _dataSource.acceptUser(userId: userId);
    return response;
  }

  Future<ResponseState<bool>> deleteUser({required userId}) async {
    final response = _dataSource.deleteUser(userId: userId);
    return response;
  }
}
