import 'package:flutter/material.dart';
import 'package:zaunfunk/features/authentication/models/zf_user.dart';
import 'package:zaunfunk/features/authentication/repositories/firebase_auth_repository.dart';
import 'package:zaunfunk/features/authentication/screens/login_screen.dart';
import 'package:zaunfunk/features/feed/app_home.dart';

class StartingApp extends StatefulWidget {
  const StartingApp({super.key});

  @override
  State<StartingApp> createState() => _StartingAppState();
}

class _StartingAppState extends State<StartingApp> {


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuthRepository().onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Builder(
              builder: (context) {
                return Text('Es ist ein Fehler aufgetreten');
              }
            ),
          );
        } else {
          if (snapshot.data == null) {
            return LoginScreen();
          } else {
            final uid = snapshot.data!.uid;
            return FutureBuilder(
              future: FirebaseAuthRepository().getUserFromCollection(uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Builder(
                    builder: (context) {
                      return Text('Es ist ein Fehler aufgetreten');
                    }
                  ));
                } else {
                  final currentUser = ZfUser(
                      userId: snapshot.data!.userId,
                      userName: snapshot.data!.userName,
                      aboutMe: snapshot.data!.aboutMe,
                      userImagePath: snapshot.data!.userImagePath);
                  return AppHome(currentUser: currentUser);
                }
              },
            );
          }
        }
      },
    );
  }
}
