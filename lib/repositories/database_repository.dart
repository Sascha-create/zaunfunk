import '../features/authentication/models/user.dart';
import '../features/article/models/user_article.dart';

abstract class DatabaseRepository {
  

  Future<User?> getCurrentUser();

  Future<List<User>> getAllUser();

  Future<List<UserArticle>> getArticles();

  Future<List<String>> getFeed();

  //Create
  Future<void> createUser(String userId ,String userName, String userPassword, String aboutMe, String userImagePath);
  // Check
  Future<bool> checkLoginData(String userName, String userPassword);

  //Create
  Future<void> createArticle(
      String userName, String userArticle, String articleImagePath);
  //Delete
  Future<void> deleteUser(User user);

  Future<void> deleteArticle(UserArticle userArticle);
}
