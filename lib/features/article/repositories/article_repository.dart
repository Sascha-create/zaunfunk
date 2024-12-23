

abstract class ArticleRepository {


  //Create
  Future<void> createArticle(String userName, String userImagePath,
      String userArticle, String articleImagePath);

  Future<void> addComment(String articleId, String userName,String userImagePath, String comment);

  Future<void> deleteArticle(String articleId);
}
