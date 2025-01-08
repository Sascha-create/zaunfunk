import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:zaunfunk/features/article/repositories/article_repository.dart';
import 'package:zaunfunk/features/authentication/logic/validator.dart';
import 'package:zaunfunk/features/authentication/widgets/club_welcome_screen.dart';
import '../../../shared/widgets/buttons/zf_elevated_button.dart';
import '../../../shared/widgets/buttons/zf_icon_button.dart';
import '../../../shared/widgets/textfields/zf_text_form_field.dart';
import '../../../shared/widgets/textfields/zf_text_form_field_pw.dart';
import '../../../shared/widgets/textfields/zf_textfield.dart';
import '../../../starting_app.dart';
import '../repositories/auth_repository.dart';

class CreateClubProfileScreen extends StatefulWidget {
  const CreateClubProfileScreen({super.key});

  @override
  State<CreateClubProfileScreen> createState() =>
      _CreateClubProfileScreenState();
}

class _CreateClubProfileScreenState extends State<CreateClubProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController locationController = TextEditingController();
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
                    "Vereinsprofil erstellen"),
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
                          labelText: "Vereinsname"),
                      ZfTextFormfield(
                          validator: isEmailValid,
                          controller: emailController,
                          labelText: "Email"),
                      ZfTextfield(
                          controller: streetController,
                          labelText: "Straße/HausNr."),
                      ZfTextfield(
                          controller: locationController, labelText: "Ort"),
                      ZfTextfield(
                          controller: aboutMeController,
                          labelText: "Vereinsinfo"),
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
                              await authRepo.signUpClub(
                                  nameController.text,
                                  emailController.text,
                                  passwordController.text,
                                  locationController.text,
                                  streetController.text,
                                  aboutMeController.text,
                                  'assets/images/splash_screen_logo.png');
                              
                              if (context.mounted) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ClubWelcomeScreen()));
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
