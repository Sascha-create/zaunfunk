abstract class ArticleRepository {
  //Create
  Future<void> createArticle(String userName, String userId, String clubId,
      String userImagePath, String userArticle, String articleImagePath, bool isClub);

  Future<void> addComment(String articleId, String userName, String clubId,
      String userImagePath, String comment);

  Future<void> deleteArticle(String articleId, String clubId);

  Future<void> setClubWelcomeMessage(String userId, String clubId);
}
