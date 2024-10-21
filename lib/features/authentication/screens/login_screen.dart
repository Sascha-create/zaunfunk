import 'package:flutter/material.dart';
import 'package:zaunfunk/config/colors.dart';
import 'package:zaunfunk/features/authentication/screens/registration_screen.dart';
import 'package:zaunfunk/home_screen.dart';
import 'package:zaunfunk/repositories/database_repository.dart';
import 'package:zaunfunk/widgets/zf_elevated_button.dart';
import 'package:zaunfunk/widgets/zf_outlined_button.dart';
import 'package:zaunfunk/widgets/zf_text_button.dart';
import 'package:zaunfunk/widgets/zf_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.repository});
  final DatabaseRepository repository;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


bool isChecked = false;

class _LoginScreenState extends State<LoginScreen> {
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
                Row(
                  children: [
                    Checkbox(
                        side: const BorderSide(color: gardenGreen),
                        overlayColor: const WidgetStatePropertyAll(gardenGreen),
                        activeColor: gardenGreen,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                    Text(
                        style: Theme.of(context).textTheme.bodyLarge,
                        "Passwort speichern"),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Column(
                    children: [
                      ZfElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomeScreen(repository: widget.repository)));
                          },
                          text: "Anmelden"),
                      const SizedBox(height: 16),
                      ZfOutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegistrationScreen(
                                        repository: widget.repository)));
                          },
                          text: "Registrieren"),
                      const SizedBox(height: 56),
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
