import '../../features/authentication/models/zf_user.dart';
import '../../features/article/models/user_article.dart';

abstract class DatabaseRepository {
  Future<ZfUser?> getCurrentUser();

  Future<ZfUser?> logoutUser();

  Future<List<ZfUser>> getAllUser();

  Future<List<UserArticle>> getArticles();

  //Create
  Future<void> createUser(String userName, String userPassword, String aboutMe,
      String userImagePath);
  // Check
  Future<bool> checkLoginData(String userName, String userPassword);

  Future<bool> isUsernameAvailable(String userName);

  //Create
  Future<void> createArticle(String userName, String userImagePath,
      String userArticle, String articleImagePath);
  //Delete
  Future<void> deleteUser(ZfUser user);

  Future<void> deleteArticle(UserArticle userArticle);
}
