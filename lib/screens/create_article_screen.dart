import 'package:flutter/material.dart';
import 'package:zaunfunk/widgets/buttons/zf_elevated_button.dart';
import 'package:zaunfunk/widgets/textfields/zf_growing_textfield.dart';

class CreateArticleScreen extends StatelessWidget {
  const CreateArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                    style: Theme.of(context).textTheme.headlineMedium,
                    "Beitrag erstellen"),
              ),
              const ZfGrowingTextfield(labelText: "Beitrag erstellen"),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ZfElevatedButton(onPressed: () {}, text: "Posten"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
