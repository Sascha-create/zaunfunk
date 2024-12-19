import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaunfunk/features/authentication/models/zf_user.dart';
import 'package:zaunfunk/features/authentication/widgets/reset_password_dialog.dart';
import 'package:zaunfunk/shared/config/colors.dart';
import 'package:zaunfunk/features/authentication/screens/create_profile_screen.dart';
import 'package:zaunfunk/features/feed/app_home.dart';
import 'package:zaunfunk/features/authentication/repositories/auth_repository.dart';
import 'package:zaunfunk/shared/widgets/buttons/zf_elevated_button.dart';
import 'package:zaunfunk/shared/widgets/buttons/zf_outlined_button.dart';
import 'package:zaunfunk/shared/widgets/buttons/zf_text_button.dart';
import 'package:zaunfunk/shared/widgets/textfields/zf_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool ispasswordVisible = true;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

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
                ZfTextfield(controller: emailController, labelText: "Email"),
                ZfTextfield(
                    controller: passwordController,
                    obscureText: ispasswordVisible,
                    labelText: "Passwort",
                    suffix: GestureDetector(
                      onTap: () {
                        setState(() {
                          ispasswordVisible = !ispasswordVisible;
                        });
                      },
                      child: Icon(
                        ispasswordVisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                    )),
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
                            await context.read<AuthRepository>().loginUser(
                                emailController.text, passwordController.text);

                            final ZfUser? currentUser = await context
                                .read<AuthRepository>()
                                .setCurrentUser();

                            if (currentUser != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AppHome(
                                            currentUser: currentUser,
                                          )));
                            } else {
                              // Muss noch raus !!!
                              print('nicht geklappt');
                            }
                          },
                          text: "Anmelden"),
                      const SizedBox(height: 16),
                      ZfOutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateProfileScreen()));
                          },
                          text: "Registrieren"),
                      const SizedBox(height: 56),
                      ZfTextButton(
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              builder: (context) => const ResetPasswordDialog(),
                            );
                          },
                          text: "Passwort vergessen"),
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
