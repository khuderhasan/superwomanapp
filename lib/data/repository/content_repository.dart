import '../model/article_model.dart';

import '../../config/result_class.dart';
import '../datasourse/content_datasource.dart';

class ContentRepository {
  final ContentDataSource _dataSource;

  ContentRepository({required ContentDataSource dataSource})
      : _dataSource = dataSource;

  Future<ResponseState<String>> getContent({required article}) async {
    final response = await _dataSource.getContent(article: article);
    return response;
  }

  Future<ResponseState<bool>> updateContent(
      {required article, required content}) async {
    final response =
        await _dataSource.updateContent(article: article, content: content);
    return response;
  }

  Future<ResponseState<ArticleModel>> getChangesContent(
      {required article, required month}) async {
    final response =
        _dataSource.getChangesContent(article: article, month: month);
    return response;
  }

  Future<ResponseState<bool>> updateChangesContent(
      {required article, required month, required text}) async {
    final response = _dataSource.updateChangesContent(
        article: article, month: month, text: text);
    return response;
  }
}
