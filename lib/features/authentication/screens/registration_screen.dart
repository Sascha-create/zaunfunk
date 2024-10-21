import 'package:flutter/material.dart';
import 'package:zaunfunk/widgets/zf_elevated_button.dart';
import 'package:zaunfunk/widgets/zf_textfield.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

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
                          "Registrieren"),
                      Text(
                          style: Theme.of(context).textTheme.bodyLarge,
                          "Erstelle dein Nutzerprofil"),
                    ],
                  ),
                ),
                const ZfTextfield(labelText: "Nutzername"),
                const ZfTextfield(labelText: "Email"),
                const ZfTextfield(labelText: "Passwort"),
                const ZfTextfield(labelText: "Passwort wiederholen"),
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child:
                      ZfElevatedButton(onPressed: () {}, text: "Registrieren"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
