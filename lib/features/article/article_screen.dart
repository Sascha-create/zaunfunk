import 'package:flutter/material.dart';
import 'package:zaunfunk/config/colors.dart';
import 'package:zaunfunk/features/article/models/user_article.dart';
import 'package:zaunfunk/features/article/delete_article_dialog.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key, required this.article});
  final UserArticle article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBeige,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
                IconButton.outlined(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => const DeleteArticleDialog());
                    },
                    icon: const Icon(Icons.delete_forever)),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(article.userImagePath),
                    radius: 24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                      style: Theme.of(context).textTheme.titleMedium,
                      article.userName),
                )
              ],
            ),
            const Divider(),
            SizedBox(
              height: 240,
              width: double.infinity,
              child: Image.asset(fit: BoxFit.cover, article.articleImagePath),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8.0),
              child: Text(
                  style: Theme.of(context).textTheme.bodyMedium,
                  article.userArticle),
            ),
          ],
        ),
      )),
    );
  }
}
