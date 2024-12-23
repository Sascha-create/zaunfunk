import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaunfunk/features/article/repositories/article_repository.dart';
import 'package:zaunfunk/shared/config/colors.dart';
import 'package:zaunfunk/shared/widgets/buttons/zf_elevated_button.dart';
import '../authentication/models/zf_user.dart';
import '../feed/app_home.dart';
import 'models/user_article.dart';

class DeleteArticleDialog extends StatelessWidget {
  const DeleteArticleDialog(
      {super.key, required this.article, required this.currentUser});

  final UserArticle article;
  final ZfUser currentUser;

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
                context
                    .read<ArticleRepository>()
                    .deleteArticle(article.articleId);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AppHome(
                              currentUser: currentUser,
                            )));
              },
              text: "löschen")
        ],
      ),
    );
  }
}
