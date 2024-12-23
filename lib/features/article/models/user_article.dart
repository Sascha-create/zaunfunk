import 'package:zaunfunk/features/article_comments/models/article_comment.dart';

class UserArticle {
  final String articleId;
  final String userName;
  final String userImagePath;
  final String userArticle;
  final String articleImagePath;
  final List<ArticleComment> articleComments;

  UserArticle({
    required this.articleId,
    required this.userName,
    required this.userImagePath,
    required this.userArticle,
    this.articleImagePath = '',
    required this.articleComments,
  });

  // void addComment(String userName, String comment) {
  //   ArticleComment newComment =
  //       ArticleComment(userName: userName, articleComment: comment);
  //   articleComments.add(newComment);
  // }
}
