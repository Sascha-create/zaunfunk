import 'package:flutter/material.dart';
import 'package:zaunfunk/shared/config/colors.dart';

class ZfTextFormfieldPassword extends StatelessWidget {
  const ZfTextFormfieldPassword({
    super.key,
    required this.labelText,
    required this.validator,
    required this.controller,
    this.suffix,
    this.obscureText,
  });
  final String labelText;
  final String? Function(String? value)? validator;
  final TextEditingController controller;
  final Widget? suffix;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        cursorColor: gardenGreen,
        obscureText: obscureText ?? true, // default true wenn nichts angegeben
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: gardenGreen, width: 0.7)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: gardenGreen)),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            labelText: labelText,
            labelStyle: const TextStyle(color: gardenGreen),
            suffix: suffix,
            fillColor: lightBeige,
            filled: true),
      ),
    );
  }
}
