import 'package:flutter/material.dart';
import 'package:zaunfunk/shared/config/colors.dart';
import 'package:zaunfunk/features/authentication/models/zf_user.dart';
import 'package:zaunfunk/features/authentication/screens/login_screen.dart';
import 'package:zaunfunk/shared/repositories/database_repository.dart';

import '../../shared/widgets/buttons/zf_elevated_button.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog(
      {super.key, required this.repository, required this.currentUser});

  final DatabaseRepository repository;
  final ZfUser currentUser;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: navBarBeige,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(size: 32, Icons.close))
            ],
          ),
          Text(style: Theme.of(context).textTheme.headlineMedium, "Abmelden"),
          const SizedBox(height: 16),
          Text(
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
              "Möchtest Du Dich von Zaunfunk abmelden?"),
          const SizedBox(height: 40),
          ZfElevatedButton(
              onPressed: () {
                // richtig so ?
                repository.logoutUser();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(repository: repository),
                  ),
                  (route) => false,
                );
                // repository.deleteArticle(article);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => AppHome(
                //               repository: repository,
                //             )));
              },
              text: "abmelden")
        ],
      ),
    );
  }
}
