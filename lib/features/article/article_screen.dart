import 'package:flutter/material.dart';
import 'package:zaunfunk/config/colors.dart';
import 'package:zaunfunk/features/article/models/user_article.dart';
import 'package:zaunfunk/features/article/delete_article_dialog.dart';
import 'package:zaunfunk/features/article_comments/comment_widget.dart';
import 'package:zaunfunk/features/article_comments/models/article_comment.dart';
import 'package:zaunfunk/features/authentication/models/user.dart';

import '../../repositories/database_repository.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen(
      {super.key,
      required this.article,
      required this.repository,
      required this.currentUser});
  final DatabaseRepository repository;
  final UserArticle article;
  final User currentUser;

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
                Visibility(
                  visible:
                      currentUser.userName == article.userName ? true : false,
                  child: IconButton.outlined(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => DeleteArticleDialog(
                                  repository: repository,
                                  article: article,
                                  currentUser: currentUser,
                                ));
                      },
                      icon: const Icon(Icons.delete_forever)),
                ),
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
                      article.userName == currentUser.userName
                          ? 'Du'
                          : article.userName),
                )
              ],
            ),
            const Divider(),
            SizedBox(
              height: article.articleImagePath == '' ? 8 : 240,
              width: double.infinity,
              child: article.articleImagePath == ''
                  ? const Text('')
                  : Image.asset(fit: BoxFit.cover, article.articleImagePath),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8.0),
              child: Text(
                  style: Theme.of(context).textTheme.bodyLarge,
                  article.userArticle),
            ),
            const Divider(),
            SizedBox(
                child: article.articleComments.isEmpty
                    ? const Text('')
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: article.articleComments.length,
                        itemBuilder: (BuildContext context, int index) =>
                            CommentWidget(
                                userName:
                                    article.articleComments[index].userName,
                                comment: article
                                    .articleComments[index].articleComment))),
            IconButton.outlined(
                onPressed: () {}, icon: const Icon(Icons.add_comment_outlined))
          ],
        ),
      )),
    );
  }
}
