class UserArticle {
  final String articleId;
  final String userName;
  final String userImagePath;
  final String userArticle;
  final String articleImagePath;

  UserArticle({
    required this.articleId,
    required this.userName,
    required this.userImagePath,
    required this.userArticle,
    this.articleImagePath = '',
  });
}
