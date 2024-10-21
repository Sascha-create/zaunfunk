import 'package:flutter/material.dart';
import 'package:zaunfunk/config/themes.dart';
import 'package:zaunfunk/repositories/database_repository.dart';
import 'package:zaunfunk/repositories/mock_database.dart';
import 'package:zaunfunk/widgets/zf_elevated_button.dart';
import 'package:zaunfunk/widgets/zf_outlined_button.dart';
import 'package:zaunfunk/widgets/zf_text_button.dart';
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Image.asset(
                      scale: 8, "assets/images/app_logo_shadow.png"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Column(
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
                ),
                const ZfTextfield(labelText: "Email / Nutzername"),
                const ZfTextfield(labelText: "Passwort"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Column(
                    children: [
                      ZfElevatedButton(onPressed: () {}, text: "Anmelden"),
                      const SizedBox(height: 16),
                      ZfOutlinedButton(onPressed: () {}, text: "Registrieren"),
                      const SizedBox(height: 88),
                      ZfTextButton(
                          onPressed: () {}, text: "Passwort vergessen"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
