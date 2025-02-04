import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaunfunk/features/article/repositories/article_repository.dart';
import 'package:zaunfunk/features/authentication/models/zf_user.dart';
import 'package:zaunfunk/shared/widgets/buttons/zf_elevated_button.dart';
import '../../../starting_app.dart';
import '../repositories/firebase_auth_repository.dart';
import '../screens/login_screen.dart';

class ClubWelcomeScreen extends StatelessWidget {
  const ClubWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuthRepository().onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Builder(builder: (context) {
            return Scaffold(
              body: Center(
                  child: Image(
                      image:
                          AssetImage('assets/images/splash_screen_logo.png'))),
            );
          });
        } else if (snapshot.hasError) {
          return Center(
            child: Builder(builder: (context) {
              return Text('${snapshot.error}');
            }),
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
                  return Builder(builder: (context) {
                    return Scaffold(
                      body: Center(
                        child: Image(
                            image: AssetImage(
                                'assets/images/splash_screen_logo.png')),
                      ),
                    );
                  });
                } else if (snapshot.hasError) {
                  return Center(child: Builder(builder: (context) {
                    return Text('${snapshot.error}');
                  }));
                } else {
                  final currentUser = ZfUser(
                      userId: snapshot.data!.userId,
                      userName: snapshot.data!.userName,
                      clubId: snapshot.data!.clubId,
                      aboutMe: snapshot.data!.aboutMe,
                      userImagePath: snapshot.data!.userImagePath,
                      isClub: snapshot.data!.isClub);
                  context.read<ArticleRepository>().setClubWelcomeMessage(
                      currentUser.userId, currentUser.clubId);
                  return Scaffold(
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                              image: AssetImage(
                                  'assets/images/splash_screen_logo.png')),
                          Text(
                              style: Theme.of(context).textTheme.headlineMedium,
                              'Dein Verein wurde erstellt'),
                          ZfElevatedButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const StartingApp(),
                                  ),
                                  (route) => false,
                                );
                              },
                              text: 'beitreten')
                        ],
                      ),
                    ),
                  );
                }
              },
            );
          }
        }
      },
    );
  }
}
