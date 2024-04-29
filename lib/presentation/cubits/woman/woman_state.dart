part of 'woman_cubit.dart';

abstract class WomanState<T> {
  factory WomanState.empty() = EmptyWomanState<T>;
  factory WomanState.loading() = LoadingWomanState<T>;
  factory WomanState.error(ErrorModel error) = ErrorWomanState<T>;
  factory WomanState.successUpdateMenstrual() = SuccessUpdateMenstrualState<T>;
  factory WomanState.emptyPregnancyDate() = EmptyPregnancyDate<T>;
  factory WomanState.loadedPregnecyDate(DateTime data) = LoadedPregnancyDate<T>;
  factory WomanState.loadedMenstrualInfo(MenstrualModel data) =
      LoadedMenstrualInfoState<T>;
}

class EmptyWomanState<T> implements WomanState<T> {
  const EmptyWomanState();
}

class LoadingWomanState<T> implements WomanState<T> {
  const LoadingWomanState();
}

class SuccessUpdateMenstrualState<T> implements WomanState<T> {
  const SuccessUpdateMenstrualState();
}

class LoadedMenstrualInfoState<T> implements WomanState<T> {
  final MenstrualModel data;
  const LoadedMenstrualInfoState(this.data);
}

class ErrorWomanState<T> implements WomanState<T> {
  final ErrorModel error;
  const ErrorWomanState(this.error);
}

class LoadedPregnancyDate<T> implements WomanState<T> {
  final DateTime data;
  const LoadedPregnancyDate(this.data);
}

class EmptyPregnancyDate<T> implements WomanState<T> {
  const EmptyPregnancyDate();
}
