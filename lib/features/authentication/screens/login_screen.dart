import 'package:flutter/material.dart';
import 'package:zaunfunk/config/colors.dart';
import 'package:zaunfunk/features/authentication/models/user.dart';
import 'package:zaunfunk/features/authentication/screens/create_profile_screen.dart';
import 'package:zaunfunk/features/authentication/screens/registration_screen.dart';
import 'package:zaunfunk/features/feed/app_home.dart';
import 'package:zaunfunk/repositories/database_repository.dart';
import 'package:zaunfunk/features/shared/widgets/buttons/zf_elevated_button.dart';
import 'package:zaunfunk/features/shared/widgets/buttons/zf_outlined_button.dart';
import 'package:zaunfunk/features/shared/widgets/buttons/zf_text_button.dart';
import 'package:zaunfunk/features/shared/widgets/textfields/zf_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.repository});
  final DatabaseRepository repository;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

bool isChecked = false;
bool isLoginDataCorrect = false;

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
                          style: Theme.of(context).textTheme.titleMedium,
                          "Melde dich mit Deinen Nutzerdaten an\noder erstelle ein Profil"),
                    ],
                  ),
                ),
                ZfTextfield(
                    controller: userNameController, labelText: "Nutzername"),
                ZfTextfield(
                    controller: passwordController,
                    obscureText: true,
                    labelText: "Passwort"),
                Row(
                  children: [
                    Checkbox(
                        side: const BorderSide(color: gardenGreen),
                        overlayColor: const WidgetStatePropertyAll(gardenGreen),
                        activeColor: gardenGreen,
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                    Text(
                        style: Theme.of(context).textTheme.titleMedium,
                        "Passwort speichern"),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Column(
                    children: [
                      ZfElevatedButton(
                          onPressed: () async {
                            isLoginDataCorrect = await widget.repository
                                .checkLoginData(userNameController.text,
                                    passwordController.text);
                            final User? currentUser =
                                widget.repository.getCurrentUser();
                            if (isLoginDataCorrect && currentUser != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AppHome(
                                            repository: widget.repository,
                                            currentUser: currentUser,
                                          )));
                            }
                          },
                          text: "Anmelden"),
                      const SizedBox(height: 16),
                      ZfOutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateProfileScreen(
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
