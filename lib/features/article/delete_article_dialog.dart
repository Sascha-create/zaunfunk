import 'package:flutter/material.dart';
import 'package:zaunfunk/config/colors.dart';
import 'package:zaunfunk/features/shared/widgets/buttons/zf_elevated_button.dart';
import 'package:zaunfunk/repositories/database_repository.dart';

import '../feed/app_home.dart';
import 'models/user_article.dart';

class DeleteArticleDialog extends StatelessWidget {
  const DeleteArticleDialog(
      {super.key, required this.repository, required this.article});

  final DatabaseRepository repository;
  final UserArticle article;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: navBarBeige,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(size: 32, Icons.close))
            ],
          ),
          Text(
              style: Theme.of(context).textTheme.headlineMedium,
              "Beitrag löschen"),
          const SizedBox(height: 16),
          Text(
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
              "Willst du deinen Beitrag wirklich löschen ?"),
          const SizedBox(height: 40),
          ZfElevatedButton(
              onPressed: () {
                repository.deleteArticle(article);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AppHome(
                              repository: repository,
                            )));
              },
              text: "löschen")
        ],
      ),
    );
  }
}
