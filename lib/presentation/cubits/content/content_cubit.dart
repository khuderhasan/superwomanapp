import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/article_model.dart';
import '../../../config/error_model.dart';
import '../../../config/result_class.dart';
import '../../../data/repository/content_repository.dart';

part 'content_state.dart';

class ContentCubit extends Cubit<ContentState> {
  final ContentRepository repository;
  ContentCubit({required this.repository}) : super(const EmptyContetnState());

  Future<void> getContent({required article}) async {
    emit(const LoadingContentState());
    await repository.getContent(article: article).then((value) {
      if (value is SuccessState<String>) {
        emit(LoadedContentState(value.data));
      } else if (value is ErrorState<String>) {
        emit(ErrorContentState(value.error));
      }
    });
  }

  Future<void> getChangesContent({required article, required month}) async {
    emit(const LoadingContentState());
    await repository
        .getChangesContent(article: article, month: month)
        .then((value) {
      if (value is SuccessState<ArticleModel>) {
        emit(LoadedChangesContentState(value.data));
      } else if (value is ErrorState<ArticleModel>) {
        emit(ErrorContentState(value.error));
      }
    });
  }

  Future<void> updateChangesContent(
      {required article, required month, required text}) async {
    emit(const LoadingContentState());
    await repository
        .updateChangesContent(article: article, month: month, text: text)
        .then((value) {
      if (value is SuccessState<bool>) {
        getChangesContent(article: article, month: month);
      } else if (value is ErrorState<bool>) {
        emit(ErrorContentState(value.error));
      }
    });
  }

  Future<void> updateContent({required article, required content}) async {
    await repository
        .updateContent(article: article, content: content)
        .then((value) {
      if (value is SuccessState<bool>) {
        getContent(article: article);
      } else if (value is ErrorState<bool>) {
        emit(ErrorContentState(value.error));
      }
    });
  }
}
