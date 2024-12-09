import 'package:flutter/material.dart';
import 'package:zaunfunk/shared/config/colors.dart';

class ZfIconButton extends StatelessWidget {
  const ZfIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        style: const ButtonStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
          backgroundColor: WidgetStatePropertyAll(impulseGreen),
        ),
        icon:
            const Icon(color: naturalBeige, Icons.photo_camera_front_outlined));
  }
}
