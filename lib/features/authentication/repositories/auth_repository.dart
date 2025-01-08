import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zaunfunk/features/authentication/models/zf_user.dart';
//import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRepository {
  /// Login
  Future<void> loginUser(String email, String password);

  Future<void> logoutUser();

  Future<void> signUpMember(
    String clubId,
    String userName,
    String email,
    String password,
    String aboutMe,
    String userImagePath,
  );

  Future<void> signUpClub(
    String clubName,
    String email,
    String password,
    String location,
    String street,
    String aboutMe,
    String userImagePath,
  );

  Future<void> createClub(
    String clubName,
    String location,
    String street,);

  Future<void> joinClub(String userId, String clubId);

  Future<QuerySnapshot<Map<String, dynamic>>> getClubs();

  Future<ZfUser?> setCurrentUser();

  Future<void> sendPasswordResetEmail(String email);

  User? getUser();

  Future<ZfUser> getUserFromCollection(String uid);

  Future<void> changeEmail(String email);
}
