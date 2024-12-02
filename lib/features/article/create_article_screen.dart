import 'package:flutter/material.dart';
import 'package:zaunfunk/features/authentication/models/user.dart';
import 'package:zaunfunk/features/feed/app_home.dart';
import 'package:zaunfunk/features/feed/home_screen.dart';
import 'package:zaunfunk/features/shared/widgets/buttons/zf_elevated_button.dart';
import 'package:zaunfunk/features/shared/widgets/textfields/zf_growing_textfield.dart';
import 'package:zaunfunk/repositories/database_repository.dart';

class CreateArticleScreen extends StatelessWidget {
  const CreateArticleScreen(
      {super.key, required this.repository, required this.currentUser});

  final DatabaseRepository repository;
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    TextEditingController articleController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                    style: Theme.of(context).textTheme.headlineMedium,
                    "Beitrag erstellen"),
              ),
              ZfGrowingTextfield(
                  controller: articleController,
                  labelText: "Beitrag erstellen..."),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ZfElevatedButton(
                    onPressed: () {
                      repository.createArticle(
                          currentUser.userName,
                          currentUser.userImagePath,
                          articleController.text,
                          '');
                      articleController.clear();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppHome(
                                    repository: repository,
                                  )));
                    },
                    text: "Posten"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
