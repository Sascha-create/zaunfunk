import 'dart:developer' as dev;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zaunfunk/features/article/repositories/article_repository.dart';

class FirestoreArticleRepository implements ArticleRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> articleStream = FirebaseFirestore.instance
      .collection('articles')
      .orderBy('createTime')
      .snapshots(includeMetadataChanges: true);

  @override
  Future<void> createArticle(String userName, String userId,String userImagePath,
      String userArticle, String articleImagePath) async {
    try {
      await _firestore.collection('articles').add({
        'createTime': Timestamp.now(),
        'userName': userName,
        'authorId': userId,
        'userImagePath': userImagePath,
        'userArticle': userArticle,
        'articleImagePath': articleImagePath
      }).then((doc) {
        doc.set({
          'articleId': doc.id,
          'createTime': Timestamp.now(),
          'userName': userName,
          'authorId': userId,
          'userImagePath': userImagePath,
          'userArticle': userArticle,
          'articleImagePath': articleImagePath
        });
      });
    } catch (e) {
      dev.log("$e");
    }
  }

  @override
  Future<void> addComment(String articleId, String userName,
      String userImagePath, String comment) async {
    try {
      await _firestore
          .collection('articles')
          .doc(articleId)
          .collection('comments')
          .add({
        'createTime': Timestamp.now(),
        'userName': userName,
        'userImagePath': userImagePath,
        'comment': comment
      });
    } catch (e) {
      dev.log("$e");
    }
  }

  @override
  Future<void> deleteArticle(String articleId) async {
    try {
      await _firestore.collection('articles').doc(articleId).delete();
    } catch (e) {
      dev.log("$e");
    }
  }
}
