import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/error_model.dart';
import '../../../config/result_class.dart';
import '../../../data/model/user_model.dart';
import '../../../data/repository/chat_repository.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository chatRepository;
  ChatCubit({required this.chatRepository}) : super(const EmptyChatState());
  Future<void> getRecentContacts() async {
    await chatRepository.getRecentContacts().then((value) {
      emit(const LoadingChatState());
      if (value is SuccessState<List<UserModel>>) {
        emit(LoadedContactsState(value.data));
      } else if (value is ErrorState<List<UserModel>>) {
        emit(ErrorChatState(value.error));
      }
    });
  }

  Future<void> sendMessage({required recieverId, required message}) async {
    await chatRepository
        .sendMessage(recieverId: recieverId, message: message)
        .then((value) {
      if (value is SuccessState<bool>) {
      } else if (value is ErrorState<bool>) {
        emit(ErrorChatState(value.error));
      }
    });
  }
}
