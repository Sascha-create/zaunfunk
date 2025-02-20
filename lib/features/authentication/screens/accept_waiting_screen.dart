import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaunfunk/features/authentication/repositories/auth_repository.dart';
import 'package:zaunfunk/starting_app.dart';

class AcceptWaitingScreen extends StatelessWidget {
  const AcceptWaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User? currentUser = context.read<AuthRepository>().getUser();

    Future<bool> isAccepted(String uid) async {
      bool memberAccepted = false;
      while (!memberAccepted) {
        Future.delayed(
          Duration(minutes: 1),
          () async {
            final DocumentSnapshot<Map<String, dynamic>> userDoc =
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(currentUser?.uid)
                    .get();

            bool accepted = userDoc['accepted'];
            memberAccepted = accepted;
            return accepted;
          },
        );
      }
      return Future.value(false);
    }

    return FutureBuilder(
      future: isAccepted(currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data! == true) {
          return StartingApp();
        } else if (snapshot.hasError) {
          return Builder(builder: (context) {
            return Text('${snapshot.error}');
          });
        } else {
          return Builder(builder: (context) {
            return Center(
                child: Text(
                    'Warte bis dein Verein deine Mitgliedschaft bestätigt'));
          });
        }
      },
    );
  }
}
