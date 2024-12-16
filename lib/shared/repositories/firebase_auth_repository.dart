import 'dart:developer' as dev;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zaunfunk/features/authentication/models/zf_user.dart';
import 'package:zaunfunk/shared/repositories/auth_repository.dart';


//import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseAuth authInstance = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  ZfUser? _currentUser;

  Stream<User?> get onAuthStateChanged => authInstance.authStateChanges();

  /// Login
  @override
  Future<void> loginUser(String email, String password) async {
    try {
      await authInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      dev.log("$e");
    }
  }

  /// Logout
  @override
  Future<void> logoutUser() async {
    try {
      await authInstance.signOut();
      _currentUser = null;
    } catch (e) {
      dev.log("$e");
    }
  }

  /// SignUp  authInstance.currentUser?.uid;
  @override
  Future<void> signUp(
    String userName,
    String email,
    String password,
    String aboutMe,
    String userImagePath,
  ) async {
    try {
      await authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      loginUser(email, password);
      try {
        
        final userId = authInstance.currentUser?.uid;
        await firestore.collection('users').add({
          'userId': userId,
          'userName': userName,
          'aboutMe': aboutMe,
          'userImagePath': userImagePath
        });
      
      } catch (e) {
        dev.log("$e");
      }
    } catch (e) {
      dev.log("$e");
    }
  }

  // Set current User in App
  @override
  Future<ZfUser?> setCurrentUser() async {
    try {
      final currentUserId = authInstance.currentUser?.uid;
      final userDocs = await firestore.collection('users').get();

      for (final doc in userDocs.docs) {
        final Map<String, dynamic> data = doc.data();

        if (data['userId'] == currentUserId) {
          final String userId = data['userId'];
          final String userName = data['userName'];
          final String aboutMe = data['aboutMe'];
          final String userImagePath = data['userImagePath'];
          final newUser = ZfUser(
              userId: userId,
              userName: userName,
              aboutMe: aboutMe,
              userImagePath: userImagePath);
          _currentUser = newUser;
          return _currentUser;
        }
      }
    } catch (e) {
      dev.log("$e");
    }
    return Future.value();
  }

  // Reset Password
  @override
  Future<void> resetPassword(String email) async {
    try {
      authInstance.sendPasswordResetEmail(email: email);
      dev.log("reset password sent to $email");
    } catch (e) {
      dev.log("$e");
    }
  }

  // Future<dynamic> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //     final GoogleSignInAuthentication? googleAuth =
  //         await googleUser?.authentication;

  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );

  //     return await authInstance.signInWithCredential(credential);
  //   } on Exception catch (e) {
  //     dev.log('exception->$e');
  //   }
  // }

  // Future<bool> signOutFromGoogle() async {
  //   try {
  //     await GoogleSignIn().signOut();
  //     await authInstance.signOut();

  //     return true;
  //   } on Exception catch (_) {
  //     return false;
  //   }
  // }

  @override
  User? getUser() {
    return authInstance.currentUser;
  }
}
