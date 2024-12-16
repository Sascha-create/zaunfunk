import 'dart:developer' as dev;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zaunfunk/features/authentication/models/zf_user.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class LoginRepository {
  final FirebaseAuth authInstance = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<User?> get onAuthStateChanged => authInstance.authStateChanges();

  /// Login
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
  Future<void> logoutUser() async {
    try {
      await authInstance.signOut();
    } catch (e) {
      dev.log("$e");
    }
  }

  /// SignUp  authInstance.currentUser?.uid;
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
        final User? createdUser = getUser();

        firestore.collection('users').add({
          'userId': createdUser!.uid,
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
  Future<ZfUser> setCurrentUser(
      // String userName,
      // String email,
      // String password,
      // String aboutMe,
      // String userImagePath,
      ) async {
    late ZfUser zfUser;
    try {
      final User? createdUser = getUser();
      final userDocs = firestore.collection('users').get();

      userDocs.then((querySnapshot) {
        for (final doc in querySnapshot.docs) {
          if (doc['userId'] == createdUser?.uid) {
            final newUser = ZfUser(
                userId: doc['userId'],
                userName: doc['userName'],
                aboutMe: doc['aboutMe'],
                userImagePath: doc['userImagePath']);
            zfUser = newUser;
          }
        }
      });
    } catch (e) {
      dev.log("$e");
    }
    return zfUser;
  }

  /// Reset Password
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

  User? getUser() {
    return authInstance.currentUser;
  }
}
