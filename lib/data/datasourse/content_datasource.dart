import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/article_model.dart';
import '../../config/error_model.dart';
import '../../config/result_class.dart';

class ContentDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ResponseState<String>> getContent({required article}) async {
    try {
      String content = '';
      await _firestore.collection('content').doc(article).get().then((value) {
        content = value.data()!['text'];
      });
      return SuccessState(content);
    } on FirebaseException catch (e) {
      return ResponseState.error(ErrorModel(code: e.code, message: e.message!));
    }
  }

  Future<ResponseState<bool>> updateContent(
      {required article, required content}) async {
    try {
      await _firestore
          .collection('content')
          .doc(article)
          .update({'text': content});
      return const SuccessState(true);
    } on FirebaseException catch (e) {
      return ResponseState.error(ErrorModel(code: e.code, message: e.message!));
    }
  }

  Future<ResponseState<ArticleModel>> getChangesContent(
      {required article, required month}) async {
    ArticleModel content = ArticleModel(image: null, text: null);
    try {
      await _firestore
          .collection('content')
          .doc(article)
          .collection(article)
          .doc(month.toString())
          .get()
          .then((value) {
        content = ArticleModel.fromMap(value.data()!);
      });
      return SuccessState(content);
    } on FirebaseException catch (e) {
      return ResponseState.error(ErrorModel(code: e.code, message: e.message!));
    }
  }

  Future<ResponseState<bool>> updateChangesContent(
      {required article, required month, required text}) async {
    try {
      await _firestore
          .collection('content')
          .doc(article)
          .collection(article)
          .doc(month.toString())
          .update({'text': text});
      return const SuccessState(true);
    } on FirebaseException catch (e) {
      return ResponseState.error(ErrorModel(code: e.code, message: e.message!));
    }
  }
}
