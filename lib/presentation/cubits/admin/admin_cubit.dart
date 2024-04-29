import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/error_model.dart';
import '../../../config/result_class.dart';
import '../../../data/model/user_model.dart';
import '../../../data/repository/admin_repository.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  final AdminRepository repository;
  AdminCubit({required this.repository}) : super(const EmptyAdminState());

  Future<void> fetchUsers() async {
    await repository.fetchUsers().then((value) {
      emit(const LoadingAdminState());
      if (value is SuccessState<List<UserModel>>) {
        emit(LoadedUsersState(value.data));
      } else if (value is ErrorState<List<UserModel>>) {
        emit(ErrorAdminState(value.error));
      }
    });
  }

  Future<void> acceptUser({required userId}) async {
    await repository.acceptUser(userId: userId).then((value) {
      if (value is SuccessState<bool>) {
        fetchUsers();
      } else if (value is ErrorState<bool>) {
        emit(ErrorAdminState(value.error));
      }
    });
  }

  Future<void> deleteUser({required userId}) async {
    await repository.deleteUser(userId: userId).then((value) {
      if (value is SuccessState<bool>) {
        fetchUsers();
      } else if (value is ErrorState<bool>) {
        emit(ErrorAdminState(value.error));
      }
    });
  }
}
