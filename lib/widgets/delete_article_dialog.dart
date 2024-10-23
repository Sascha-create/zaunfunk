import 'package:flutter/material.dart';
import 'package:zaunfunk/config/colors.dart';
import 'package:zaunfunk/widgets/buttons/zf_elevated_button.dart';

class DeleteArticleDialog extends StatelessWidget {
  const DeleteArticleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: navBarBeige,
      title: const Center(child: Text("Beitrag löschen")),
      titleTextStyle: const TextStyle(
          color: gardenGreen, fontSize: 30, fontWeight: FontWeight.bold),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
              "Willst du deinen Beitrag wirklich löschen ?"),
          const SizedBox(height: 40),
          ZfElevatedButton(onPressed: () {}, text: "löschen")
        ],
      ),
    );
  }
}
