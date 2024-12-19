import 'package:flutter/material.dart';
import 'package:zaunfunk/shared/config/colors.dart';

class ZfIconButton extends StatelessWidget {
  const ZfIconButton({super.key, required this.onPressed, required this.icon});
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
          backgroundColor: WidgetStatePropertyAll(impulseGreen),
        ),
        icon:
             Icon(color: naturalBeige, icon));
  }
}
