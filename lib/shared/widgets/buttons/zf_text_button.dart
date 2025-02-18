import 'package:flutter/material.dart';
import 'package:zaunfunk/shared/config/colors.dart';

class ZfTextButton extends StatelessWidget {
  const ZfTextButton({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          fixedSize: WidgetStatePropertyAll(Size(160, 40)),
        ),
        child: Text(style: TextStyle(color: gardenGreen, fontSize: 14), text));
  }
}
