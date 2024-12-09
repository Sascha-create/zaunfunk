import 'package:flutter/material.dart';
import 'package:zaunfunk/shared/config/colors.dart';

class ZfTextfield extends StatelessWidget {
  const ZfTextfield({
    super.key,
    required this.labelText,
    required this.controller,
    this.obscureText,
  });
  final String labelText;
  final TextEditingController controller;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText ?? false,
        cursorColor: gardenGreen,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: gardenGreen, width: 0.7)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: gardenGreen)),
            labelText: labelText,
            labelStyle: const TextStyle(color: gardenGreen),
            fillColor: lightBeige,
            filled: true),
      ),
    );
  }
}
