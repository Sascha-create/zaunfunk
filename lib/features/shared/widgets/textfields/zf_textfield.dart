import 'package:flutter/material.dart';
import 'package:zaunfunk/config/colors.dart';

class ZfTextfield extends StatelessWidget {
  const ZfTextfield({
    super.key,
    required this.labelText,
  });
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextField(
        cursorColor: gardenGreen,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: gardenGreen)),
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
