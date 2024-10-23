import 'package:flutter/material.dart';
import 'package:zaunfunk/config/colors.dart';

class ProfileGridItem extends StatelessWidget {
  const ProfileGridItem({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          border: Border.all(color: gardenGreen, strokeAlign: 1),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Image.asset(fit: BoxFit.cover, imagePath),
      ),
    );
  }
}
