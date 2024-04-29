import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/error_model.dart';
import '../../../config/result_class.dart';
import '../../../data/model/menstrual_model.dart';
import '../../../data/repository/woman_repository.dart';
import '../../../util/prefrences_helper.dart';

part 'woman_state.dart';

class WomanCubit extends Cubit<WomanState> {
  final WomanRepository repository;
  WomanCubit({required this.repository}) : super(const EmptyWomanState());

  Future<void> setMenstrualInfo(
      {required menstrualDate, required cycleLength}) async {
    emit(const LoadingWomanState());
    await repository
        .setMenstrualInfo(
            menstrualDate: menstrualDate, cycleLength: cycleLength)
        .then((value) {
      if (value is SuccessState<bool>) {
        emit(const SuccessUpdateMenstrualState());
        getMenstrualInfo();
      } else if (value is ErrorState<bool>) {
        emit(ErrorWomanState(value.error));
      }
    });
  }

  Future<void> getMenstrualInfo() async {
    emit(const LoadingWomanState());
    await repository.getMenstrualInfo().then((value) {
      if (value is SuccessState<MenstrualModel>) {
        emit(LoadedMenstrualInfoState(value.data));
      } else if (value is ErrorState<MenstrualModel>) {
        emit(ErrorWomanState(value.error));
      }
    });
  }

  Future<void> setPregnencyStartDate({required pregnancyStartDate}) async {
    await repository
        .setPregnancyStartDate(pregnancyStartDate: pregnancyStartDate)
        .then((value) {
      if (value is SuccessState<DateTime>) {
        emit(LoadedPregnancyDate(value.data));
        getPregnancyStartDate();
      } else if (value is ErrorState<DateTime>) {
        emit(ErrorWomanState(value.error));
      }
    });
  }

  Future<void> getPregnancyStartDate() async {
    final currnetUserInfo = await PrefHelper.getSavedInfo();
    if (currnetUserInfo.pregnencyStartDate == null) {
      emit(const EmptyPregnancyDate());
    } else if (currnetUserInfo.pregnencyStartDate != null) {
      emit(LoadedPregnancyDate(currnetUserInfo.pregnencyStartDate!));
    }
  }
}
