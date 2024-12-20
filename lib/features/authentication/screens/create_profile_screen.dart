import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:zaunfunk/features/authentication/validator.dart';
import 'package:zaunfunk/features/feed/app_home.dart';
import 'package:zaunfunk/features/authentication/repositories/auth_repository.dart';
import 'package:zaunfunk/shared/widgets/textfields/zf_text_form_field_pw.dart';
import 'package:zaunfunk/shared/repositories/database_repository.dart';
import 'package:zaunfunk/shared/widgets/buttons/zf_elevated_button.dart';
import 'package:zaunfunk/shared/widgets/buttons/zf_icon_button.dart';
import 'package:zaunfunk/shared/widgets/textfields/zf_textfield.dart';

import '../../../shared/widgets/textfields/zf_text_form_field.dart';
import '../models/zf_user.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({
    super.key,
  });

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isNameAvailable = false;
  bool isLoginDataCorrect = false;
  bool ispasswordVisible = true;

  String? isConfirmPassword(String? value) {
    if (value == null) return "Kein Passwort";
    if (value != passwordController.text) return "Passwort nicht gleich";
    if (value == passwordController.text) return null;
    return null;
  }

  final picker = ImagePicker();
  XFile? pickedFile;
  File? image;

  Future<void> getImage() async {
    pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile!.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DatabaseRepository repository = context.read<DatabaseRepository>();
    final AuthRepository authRepo = context.read<AuthRepository>();

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Column(
              children: [
                Text(
                    style: Theme.of(context).textTheme.headlineMedium,
                    "Nutzerprofil erstellen"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Stack(clipBehavior: Clip.none, children: [
                    CircleAvatar(
                      backgroundImage: image == null
                          ? AssetImage("assets/images/app_logo_shadow.png")
                          : FileImage(image!),
                      radius: 64,
                    ),
                    Positioned(
                        bottom: -8,
                        right: -16,
                        child: ZfIconButton(
                          onPressed: () async {
                            await getImage();
                            setState(() {});
                          },
                          icon: Icons.photo_camera_front_outlined,
                        ))
                  ]),
                ),
                Row(
                  children: [
                    const Text("Box"),
                    Text(
                        style: Theme.of(context).textTheme.headlineSmall,
                        "Verein"),
                  ],
                ),
                Row(
                  children: [
                    const Text("Box"),
                    Text(
                        style: Theme.of(context).textTheme.headlineSmall,
                        "Mitglied"),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      ZfTextFormfield(
                          validator: isValidUsername,
                          controller: nameController,
                          labelText: "Nutzername"),
                      ZfTextFormfield(
                          validator: isEmailValid,
                          controller: emailController,
                          labelText: "Email"),
                      ZfTextfield(
                          controller: aboutMeController,
                          labelText: "Über mich"),
                      ZfTextFormfieldPassword(
                          labelText: 'Passwort',
                          validator: isValidPassword,
                          controller: passwordController,
                          obscureText: ispasswordVisible,
                          suffix: GestureDetector(
                            onTap: () {
                              setState(() {
                                ispasswordVisible = !ispasswordVisible;
                              });
                            },
                            child: Icon(ispasswordVisible
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                          )),
                      ZfTextFormfieldPassword(
                          labelText: 'Passwort wiederholen',
                          validator: isConfirmPassword,
                          controller: passwordConfirmController,
                          obscureText: ispasswordVisible,
                          suffix: GestureDetector(
                            onTap: () {
                              setState(() {
                                ispasswordVisible = !ispasswordVisible;
                              });
                            },
                            child: Icon(ispasswordVisible
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                          )),
                      ZfElevatedButton(
                          onPressed: () async {
                            // validieren dann create User
                            if (_formKey.currentState!.validate()) {
                              // Username prüfen ???
                              isNameAvailable = await repository
                                  .isUsernameAvailable(nameController.text);
                              await authRepo.signUp(
                                  nameController.text,
                                  emailController.text,
                                  passwordController.text,
                                  aboutMeController.text,
                                  'assets/images/app_logo_shadow.png');
                              // User als currentUser setzen

                              final ZfUser? currentUser =
                                  await authRepo.setCurrentUser();
                              if (currentUser != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AppHome(
                                              currentUser: currentUser,
                                            )));
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Nutzername schon vergeben !')));
                            }
                          },
                          text: "Registrieren"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
