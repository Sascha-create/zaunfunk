import 'dart:developer' as dev;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zaunfunk/features/article/models/user_article.dart';
import 'package:zaunfunk/features/article/repositories/article_repository.dart';

class FirestoreArticleRepository implements ArticleRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<void> createArticle(String userName, String userImagePath,
      String userArticle, String articleImagePath) async {
    try {
      _firestore.collection('articles').add({
        'userName': userName,
        'userImagePath': userImagePath,
        'userArticle': userArticle,
        'articleImagePath': articleImagePath
      });
    } catch (e) {
      dev.log("$e");
    }
  }

  @override
  Future<void> deleteArticle(UserArticle userArticle) {
    // TODO: implement deleteArticle
    throw UnimplementedError();
  }

// wahrscheinlich über StreamBuilder
  @override
  Future<List<UserArticle>> getArticles() {
    // TODO: implement getArticles
    throw UnimplementedError();
  }
}
