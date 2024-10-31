import 'database_repository.dart';
import '../features/authentication/models/user.dart';
import '../features/article/models/user_article.dart';

class MockDatabase implements DatabaseRepository {
  List<User> users = [
    User(
        userName: "Sascha",
        userPassword: "baum123",
        userImagePath: "assets/images/ich.jpeg"),
    User(
        userName: "Jane",
        userPassword: "rose123",
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

  @override
  List<User> getAllUser() {
    return users;
  }

  @override
  List<UserArticle> getArticles() {
    return articles;
  }

  @override
  List<String> getFeed() {
    List<String> feed = [];
    for (UserArticle currentArticle in articles) {
      feed.add("${currentArticle.userName} : ${currentArticle.userArticle}");
    }
    return feed;
  }

  @override
  void createUser(String userName, String userPassword, String userImagePath) {
    User newUser = User(
        userName: userName,
        userPassword: userPassword,
        userImagePath: userImagePath);
    users.add(newUser);
  }

  @override
  bool checkLoginData(String userName, String userPassword) {
    for (User currentUser in users) {
      if (currentUser.userName == userName) {
        if (currentUser.userPassword == userPassword) {
          return true;
        } else {
          return false;
        }
      }
    }
    return false;
  }

  @override
  void createArticle(String userName, String userArticle, String articleImagePath) {
    UserArticle newUserArticle =
        UserArticle(userName: userName, userArticle: userArticle, articleImagePath: articleImagePath);
    articles.add(newUserArticle);
  }

  @override
  void deleteUser(User user) {
    for (User currentUser in users) {
      if (currentUser.userName == user.userName) {
        if (currentUser.userPassword == user.userPassword) {
          users.remove(currentUser);
          break;
        }
      }
    }
  }

  @override
  void deleteArticle(UserArticle userArticle) {
    for (UserArticle currentArticle in articles) {
      if (currentArticle.userName == userArticle.userName) {
        if (currentArticle.userArticle == userArticle.userArticle) {
          articles.remove(currentArticle);
          break;
        }
      }
    }
  }
}
