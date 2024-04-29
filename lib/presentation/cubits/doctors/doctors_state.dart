part of 'doctors_cubit.dart';

abstract class DoctorsState<T> {
  factory DoctorsState.empty() = EmptyDoctorsState<T>;
  factory DoctorsState.loading() = LoadingDoctorsState<T>;
  factory DoctorsState.error(ErrorModel error) = ErrorDoctorsState<T>;
  factory DoctorsState.loadedDoctorsState(List<DoctorModel> data) =
      LoadedDoctorsState<T>;
}

class LoadedDoctorsState<T> implements DoctorsState<T> {
  final List<DoctorModel> data;
  const LoadedDoctorsState(this.data);
}

class EmptyDoctorsState<T> implements DoctorsState<T> {
  const EmptyDoctorsState();
}

class LoadingDoctorsState<T> implements DoctorsState<T> {
  const LoadingDoctorsState();
}

class ErrorDoctorsState<T> implements DoctorsState<T> {
  final ErrorModel error;
  const ErrorDoctorsState(this.error);
}
