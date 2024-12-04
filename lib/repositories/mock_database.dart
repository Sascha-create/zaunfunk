import 'database_repository.dart';
import '../features/authentication/models/user.dart';
import '../features/article/models/user_article.dart';

class MockDatabase implements DatabaseRepository {
  List<User> users = [
    User(
        userId: '1',
        userName: "Sascha",
        userPassword: "baum123",
        aboutMe:
            'Garten 82 dskjafhdsflkdsjgfkdlgjfdlkgjfdglödfkgfdlöagjfdlhjfdlkgjhfdlgkjdsaföljdaflgjafdglkjdgälajkdg',
        userImagePath: "assets/images/ich.jpeg"),
    User(
        userId: '2',
        userName: "Jane",
        userPassword: "rose123",
        aboutMe: 'Ich liebe Rosen',
        userImagePath: "assets/images/jane.png")
  ];

  List<String> userIds = ['1', '2'];

  List<UserArticle> articles = [
    UserArticle(
        userName: "Sascha",
        userImagePath: "assets/images/ich.jpeg",
        userArticle:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
        articleImagePath: "assets/images/ernte.png",
        articleComments: []),
    UserArticle(
        userName: "Sascha",
        userImagePath: "assets/images/ich.jpeg",
        userArticle:
            "Ich habe Gehwegplatten abzugeben ! Essen und trinken ist auch genug da",
        articleImagePath: "assets/images/floor.png",
        articleComments: []),
    UserArticle(
        userName: "Jane",
        userImagePath: "assets/images/jane.png",
        userArticle: "Will jemand Ableger von meinen Rosen haben ?",
        articleImagePath: "assets/images/roses.png",
        articleComments: [])
  ];

  User? _currentUser;

  @override
  User? getCurrentUser() {
    return _currentUser;
  }

  @override
  User? logoutUser() {
    return _currentUser = null;
  }

  @override
  Future<List<User>> getAllUser() {
    return Future.value(users);
  }

  @override
  Future<List<UserArticle>> getArticles() {
    return Future.delayed(const Duration(seconds: 1), () {
      return articles;
    });
  }

  @override
  Future<bool> isUsernameAvailable(String userName) {
    User newUser = User(
        userId: '000',
        userName: userName,
        userPassword: 'password',
        aboutMe: 'aboutMe',
        userImagePath: 'userImagePath');
    for (User currentUser in users) {
      if (currentUser.userName == newUser.userName) {
        return Future.value(false);
      } else {
        return Future.value(true);
      }
    }
    return Future.value(true);
  }

  @override
  Future<void> createUser(String userName, String userPassword, String aboutMe,
      String userImagePath) {
    int lastId = int.parse(userIds.last);
    int newId = lastId + 1;
    User newUser = User(
        userId: newId.toString(),
        userName: userName,
        userPassword: userPassword,
        aboutMe: aboutMe,
        userImagePath: userImagePath);

    users.add(newUser);
    return Future.value();
  }

  @override
  Future<bool> checkLoginData(String userName, String userPassword) {
    return Future.delayed(const Duration(seconds: 1), () {
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
  Future<void> createArticle(String userName, String userImagePath,
      String userArticle, String articleImagePath) {
    UserArticle newUserArticle = UserArticle(
        userName: userName,
        userImagePath: userImagePath,
        userArticle: userArticle,
        articleImagePath: articleImagePath,
        articleComments: []);
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
