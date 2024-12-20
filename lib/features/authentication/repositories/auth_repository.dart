import 'package:firebase_auth/firebase_auth.dart';
import 'package:zaunfunk/features/authentication/models/zf_user.dart';
//import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRepository {
  /// Login
  Future<void> loginUser(String email, String password);

  Future<void> logoutUser();

  Future<void> signUp(
    String userName,
    String email,
    String password,
    String aboutMe,
    String userImagePath,
  );

  Future<ZfUser?> setCurrentUser();

  Future<void> sendPasswordResetEmail(String email);

  User? getUser();

  

  Future<void> changeEmail(String email);
}
