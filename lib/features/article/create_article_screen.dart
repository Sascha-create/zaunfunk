import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaunfunk/features/article/repositories/article_repository.dart';
import 'package:zaunfunk/features/authentication/models/zf_user.dart';
import 'package:zaunfunk/features/feed/app_home.dart';
import 'package:zaunfunk/shared/widgets/buttons/zf_elevated_button.dart';
import 'package:zaunfunk/shared/widgets/textfields/zf_growing_textfield.dart';

class CreateArticleScreen extends StatelessWidget {
  const CreateArticleScreen({super.key, required this.currentUser});

  final ZfUser currentUser;

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
                    onPressed: () async {
                      await context.read<ArticleRepository>().createArticle(
                          currentUser.userName,
                          currentUser.userImagePath,
                          articleController.text,
                          '');
                      articleController.clear();
                      if (context.mounted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AppHome(
                                      currentUser: currentUser,
                                    )));
                      }
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
