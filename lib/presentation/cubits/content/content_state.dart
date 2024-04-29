part of 'content_cubit.dart';

abstract class ContentState<T> {
  factory ContentState.empty() = EmptyContetnState<T>;
  factory ContentState.loading() = LoadingContentState<T>;
  factory ContentState.loadedContent(String content) = LoadedContentState<T>;
  factory ContentState.loadedChangesContent(ArticleModel data) =
      LoadedChangesContentState<T>;
  factory ContentState.error(ErrorModel error) = ErrorContentState<T>;
}

class EmptyContetnState<T> implements ContentState<T> {
  const EmptyContetnState();
}

class LoadingContentState<T> implements ContentState<T> {
  const LoadingContentState();
}

class LoadedContentState<T> implements ContentState<T> {
  final String data;
  const LoadedContentState(this.data);
}

class LoadedChangesContentState<T> implements ContentState<T> {
  final ArticleModel data;
  const LoadedChangesContentState(this.data);
}

class ErrorContentState<T> implements ContentState<T> {
  final ErrorModel error;
  const ErrorContentState(this.error);
}
