part of 'chat_cubit.dart';

abstract class ChatState<T> {
  factory ChatState.empty() = EmptyChatState<T>;
  factory ChatState.loading() = LoadingChatState<T>;
  factory ChatState.loadedContacts(List<UserModel> data) =
      LoadedContactsState<T>;

  factory ChatState.error(ErrorModel error) = ErrorChatState<T>;
}

class EmptyChatState<T> implements ChatState<T> {
  const EmptyChatState();
}

class LoadingChatState<T> implements ChatState<T> {
  const LoadingChatState();
}

class LoadedContactsState<T> implements ChatState<T> {
  final List<UserModel> data;

  const LoadedContactsState(this.data);
}

class ErrorChatState<T> implements ChatState<T> {
  final ErrorModel error;
  const ErrorChatState(this.error);
}
