import 'package:flutter/material.dart';
import 'package:zaunfunk/config/colors.dart';

class ZfOutlinedButton extends StatelessWidget {
  const ZfOutlinedButton(
      {super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {},
        style: const ButtonStyle(
          fixedSize: WidgetStatePropertyAll(Size(160, 40)),
          side: WidgetStatePropertyAll(BorderSide(color: gardenGreen)),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          )),
        ),
        child: Text(
            style: const TextStyle(color: gardenGreen, fontSize: 20), text));
  }
}
