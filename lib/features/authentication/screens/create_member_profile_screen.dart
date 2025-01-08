import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:zaunfunk/features/authentication/logic/validator.dart';
import 'package:zaunfunk/features/authentication/models/zf_club.dart';
import 'package:zaunfunk/features/authentication/repositories/auth_repository.dart';
import 'package:zaunfunk/shared/widgets/textfields/zf_text_form_field_pw.dart';
import 'package:zaunfunk/shared/widgets/buttons/zf_elevated_button.dart';
import 'package:zaunfunk/shared/widgets/buttons/zf_icon_button.dart';
import 'package:zaunfunk/shared/widgets/textfields/zf_textfield.dart';
import 'package:zaunfunk/starting_app.dart';
import '../../../shared/widgets/textfields/zf_text_form_field.dart';

class CreateMemberProfileScreen extends StatefulWidget {
  const CreateMemberProfileScreen({
    super.key,
    required this.chosenClub,
  });

  final ZfClub chosenClub;

  @override
  State<CreateMemberProfileScreen> createState() =>
      _CreateMemberProfileScreenState();
}

class _CreateMemberProfileScreenState extends State<CreateMemberProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    "Mitgliedsprofil erstellen"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Stack(clipBehavior: Clip.none, children: [
                    CircleAvatar(
                      backgroundImage: image == null
                          ? AssetImage("assets/images/splash_screen_logo.png")
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
                              await authRepo.signUpMember(
                                  widget.chosenClub.clubId,
                                  nameController.text,
                                  emailController.text,
                                  passwordController.text,
                                  aboutMeController.text,
                                  'assets/images/splash_screen_logo.png');

                              if (context.mounted) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const StartingApp(),
                                  ),
                                  (route) => false,
                                );
                              }
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
