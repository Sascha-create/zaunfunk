import '../features/authentication/models/user.dart';
import '../features/article/models/user_article.dart';

abstract class DatabaseRepository {
  List<User> getAllUser();

  List<UserArticle> getArticles();

  List<String> getFeed();

  //Create
  void createUser(String userName, String userPassword, String userImagePath);
  // Check
  bool checkLoginData(String userName, String userPassword);

  //Create
  void createArticle(String userName, String userArticle, String articleImagePath);
  //Delete
  void deleteUser(User user);

  void deleteArticle(UserArticle userArticle);
}
