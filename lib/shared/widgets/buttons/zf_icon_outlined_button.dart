import 'package:flutter/material.dart';
import 'package:zaunfunk/shared/config/colors.dart';

class ZfIconOutlinedButton extends StatelessWidget {
  const ZfIconOutlinedButton(
      {super.key, required this.onPressed, required this.icon});
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(
                CircleBorder(side: BorderSide(width: 1, color: gardenGreen)))),
        onPressed: onPressed,
        icon: Icon(icon));
  }
}
