import 'package:flutter/material.dart';
import 'package:zaunfunk/config/colors.dart';

class ZfTextFormfield extends StatelessWidget {
  const ZfTextFormfield({
    super.key,
    required this.labelText,
    required this.validator,
    required this.controller,
  });
  final String labelText;
  final String? Function(String? value)? validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        cursorColor: gardenGreen,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: gardenGreen)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: gardenGreen)),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            labelText: labelText,
            labelStyle: const TextStyle(color: gardenGreen),
            fillColor: lightBeige,
            filled: true),
      ),
    );
  }
}
