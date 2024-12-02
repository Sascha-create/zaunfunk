import 'database_repository.dart';
import '../features/authentication/models/user.dart';
import '../features/article/models/user_article.dart';

class MockDatabase implements DatabaseRepository {
  List<User> users = [
    User(
      userId: '001',
        userName: "Sascha",
        userPassword: "baum123",
        aboutMe: 'Garten 82',
        userImagePath: "assets/images/ich.jpeg"),
    User(
      userId: '002',
        userName: "Jane",
        userPassword: "rose123",
        aboutMe: 'Ich liebe Rosen',
        userImagePath: "assets/images/jane.png")
  ];
  List<UserArticle> articles = [
    UserArticle(
        userName: "Sascha",
        userArticle:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
        articleImagePath: "assets/images/ernte.png"),
    UserArticle(
        userName: "Sascha",
        userArticle:
            "Ich habe Gehwegplatten abzugeben ! Essen und trinken ist auch genug da",
        articleImagePath: "assets/images/floor.png"),
    UserArticle(
        userName: "Jane",
        userArticle: "Will jemand Ableger von meinen Rosen haben ?",
        articleImagePath: "assets/images/roses.png")
  ];

  User? _currentUser;

  @override
  Future<User?> getCurrentUser() {
    return Future.value(_currentUser);
  }

  

  @override
  Future<List<User>> getAllUser() {
    return Future.value(users);
  }

  @override
  Future<List<UserArticle>> getArticles() {
    return Future.delayed(const Duration(seconds: 2), () {
      return articles;
    });
  }

  @override
  Future<List<String>> getFeed() {
    List<String> feed = [];
    for (UserArticle currentArticle in articles) {
      feed.add("${currentArticle.userName} : ${currentArticle.userArticle}");
    }
    return Future.value(feed);
  }

  @override
  Future<void> createUser(
      String userId ,String userName, String userPassword, String aboutMe, String userImagePath) {
    User newUser = User(
      userId: userId,
        userName: userName,
        userPassword: userPassword,
        aboutMe: aboutMe,
        userImagePath: userImagePath);
    users.add(newUser);
    return Future.value();
  }

  @override
  Future<bool> checkLoginData(String userName, String userPassword) {
    return Future.delayed(const Duration(seconds: 2), () {
      for (User currentUser in users) {
        if (currentUser.userName == userName) {
          if (currentUser.userPassword == userPassword) {
            _currentUser = currentUser;
            return Future.value(true);
          } else {
            return Future.value(false);
          }
        }
      }
      return Future.value(false);
    });
  }

  @override
  Future<void> createArticle(
      String userName, String userArticle, String articleImagePath) {
    UserArticle newUserArticle = UserArticle(
        userName: userName,
        userArticle: userArticle,
        articleImagePath: articleImagePath);
    articles.add(newUserArticle);
    return Future.value();
  }

  @override
  Future<void> deleteUser(User user) {
    for (User currentUser in users) {
      if (currentUser.userName == user.userName) {
        if (currentUser.userPassword == user.userPassword) {
          users.remove(currentUser);
          break;
        }
      }
    }
    return Future.value();
  }

  @override
  Future<void> deleteArticle(UserArticle userArticle) {
    for (UserArticle currentArticle in articles) {
      if (currentArticle.userName == userArticle.userName) {
        if (currentArticle.userArticle == userArticle.userArticle) {
          articles.remove(currentArticle);
          break;
        }
      }
    }
    return Future.value();
  }
}
