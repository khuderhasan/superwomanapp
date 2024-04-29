import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/error_model.dart';
import '../../../config/result_class.dart';
import '../../../data/model/doctor_model.dart';
import '../../../data/repository/chat_repository.dart';

part 'doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  final ChatRepository chatRepository;
  DoctorsCubit({required this.chatRepository})
      : super(const EmptyDoctorsState());

  Future<void> getDoctors() async {
    await chatRepository.getDoctors().then((value) {
      emit(const LoadingDoctorsState());
      if (value is SuccessState<List<DoctorModel>>) {
        emit(LoadedDoctorsState(value.data));
      } else if (value is ErrorState<List<DoctorModel>>) {
        emit(ErrorDoctorsState(value.error));
      }
    });
  }
}
