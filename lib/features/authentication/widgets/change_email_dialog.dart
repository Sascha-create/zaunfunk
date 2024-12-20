import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaunfunk/features/authentication/validator.dart';
import 'package:zaunfunk/shared/config/colors.dart';
import 'package:zaunfunk/features/authentication/repositories/auth_repository.dart';
import 'package:zaunfunk/shared/widgets/buttons/zf_elevated_button.dart';
import 'package:zaunfunk/shared/widgets/textfields/zf_text_form_field.dart';

class ChangeEmailDialog extends StatefulWidget {
  const ChangeEmailDialog({super.key});

  @override
  State<ChangeEmailDialog> createState() => _ChangeEmailDialogState();
}

class _ChangeEmailDialogState extends State<ChangeEmailDialog> {
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: navBarBeige,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(size: 32, Icons.close))
            ],
          ),
          Text(
              style: Theme.of(context).textTheme.headlineMedium,
              "Email ändern"),
          const SizedBox(height: 16),
          Text(
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
              "Bitte registrierte Email eingeben, um den Link zur Email Bestätigung zu erhalten"),
          Form(
            key: _formKey,
            child: ZfTextFormfield(
                labelText: 'Email',
                validator: isEmailValid,
                controller: emailController),
          ),
          const SizedBox(height: 40),
          ZfElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await context
                      .read<AuthRepository>()
                      .changeEmail(emailController.text);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Email versendet !')));
                    Navigator.pop(context);
                  }
                }
              },
              text: "Senden")
        ],
      ),
    );
  }
}
