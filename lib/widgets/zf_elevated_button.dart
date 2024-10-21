import 'package:flutter/material.dart';
import 'package:zaunfunk/config/colors.dart';

class ZfElevatedButton extends StatelessWidget {
  const ZfElevatedButton(
      {super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: const ButtonStyle(
          fixedSize: WidgetStatePropertyAll(Size(160, 40)),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
          backgroundColor: WidgetStatePropertyAll(impulseGreen),
        ),
        child: Text(
            style: const TextStyle(color: naturalBeige, fontSize: 20), text));
  }
}
