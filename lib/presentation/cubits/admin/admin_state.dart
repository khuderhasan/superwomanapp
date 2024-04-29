part of 'admin_cubit.dart';

abstract class AdminState<T> {
  factory AdminState.empty() = EmptyAdminState<T>;
  factory AdminState.loading() = LoadingAdminState<T>;
  factory AdminState.loadedUsersState(List<UserModel> data) =
      LoadedUsersState<T>;
  factory AdminState.error(ErrorModel error) = ErrorAdminState<T>;
}

class EmptyAdminState<T> implements AdminState<T> {
  const EmptyAdminState();
}

class LoadingAdminState<T> implements AdminState<T> {
  const LoadingAdminState();
}

class LoadedUsersState<T> implements AdminState<T> {
  final List<UserModel> data;
  LoadedUsersState(this.data);
}

class ErrorAdminState<T> implements AdminState<T> {
  final ErrorModel error;

  ErrorAdminState(this.error);
}
