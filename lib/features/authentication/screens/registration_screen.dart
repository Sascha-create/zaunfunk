import 'package:flutter/material.dart';
import 'package:zaunfunk/features/feed/app_home.dart';
import 'package:zaunfunk/shared/widgets/buttons/zf_elevated_button.dart';
import 'package:zaunfunk/shared/widgets/textfields/zf_text_form_field.dart';
import 'package:zaunfunk/shared/widgets/textfields/zf_text_form_field_pw.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({
    super.key,
  });

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? isValidUsername(String? value) {
    if (value == null) {
      return "kein Nutzername angegeben";
    }
    if (value.length < 2) return "Nutzername mehr als 2 Zeichen";
    if (value.length > 20) return "Nutzername maximal 20 Zeichen";

    return null;
  }

  String? isEmailValid(String? value) {
    if (value == null) return "keine Email";
    if (value.length < 5) return "Email zu kurz";
    if (value.length > 30) return "Email zu lang";
    if (value.contains(",")) return "Darf kein , enthalten";
    if (value.contains("@")) return null;
    if (value.contains(".")) return null;
    return null;
  }

  String? isValidPassword(String? value) {
    // null muss geprüft immer werden
    if (value == null) return "kein Passwort angegeben";
    if (value.length < 5) return "Passwort mehr als 5 Zeichen";
    if (value.length > 20) return "Passwort maximal 20 Zeichen";
    return null;
  }

  String? isConfirmPassword(String? value) {
    if (value == null) return "Kein Passwort";
    if (value != passwordController.text) return "Passwort nicht gleich";
    if (value == passwordController.text) return null;
    return null;
  }

  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Form(
              key: _formKey,
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
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
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
                  ZfTextFormfield(
                    labelText: "Nutzername",
                    validator: isValidUsername,
                    controller: userNameController,
                  ),
                  ZfTextFormfield(
                    labelText: "Email",
                    validator: isEmailValid,
                    controller: emailController,
                  ),
                  ZfTextFormfieldPassword(
                      labelText: "Passwort",
                      obscureText: passwordVisible,
                      validator: isValidPassword,
                      controller: passwordController,
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        child: Icon(passwordVisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined),
                      )),
                  ZfTextFormfieldPassword(
                      labelText: "Passwort wiederholen",
                      //obscureText: passwordVisible,
                      validator: isConfirmPassword,
                      controller: passwordConfirmController,
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        child: Icon(passwordVisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 48.0),
                    child: ZfElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AppHome()));
                          }
                        },
                        text: "Registrieren"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
