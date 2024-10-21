
import 'package:flutter/material.dart';
import 'package:zaunfunk/article_card.dart';
import 'package:zaunfunk/config/themes.dart';
import 'package:zaunfunk/home_screen.dart';
import 'package:zaunfunk/models/user.dart';
import 'package:zaunfunk/repositories/database_repository.dart';
import 'package:zaunfunk/repositories/mock_database.dart';
import 'package:zaunfunk/config/colors.dart';
import 'package:zaunfunk/widgets/zf_elevated_button.dart';
import 'package:zaunfunk/widgets/zf_outlined_button.dart';
import 'package:zaunfunk/widgets/zf_textfield.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final DatabaseRepository repository = MockDatabase();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(scale: 8, "assets/images/app_logo_shadow.png"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                        style: Theme.of(context).textTheme.headlineMedium,
                        "Anmelden"),
                    Text(
                        style: Theme.of(context).textTheme.bodyLarge,
                        "Melde dich mit Deinen Nutzerdaten an\noder erstelle ein Profil"),
                  ],
                ),
                const ZfTextfield(labelText: "Email / Nutzername"),
                const ZfTextfield(labelText: "Passwort"),
                ZfElevatedButton(onPressed: () {}, text: "Anmelden"),
                ZfOutlinedButton(onPressed: () {}, text: "Registrieren")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
