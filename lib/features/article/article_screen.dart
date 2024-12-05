import 'package:flutter/material.dart';
import 'package:zaunfunk/config/colors.dart';
import 'package:zaunfunk/features/article/models/user_article.dart';
import 'package:zaunfunk/features/article/delete_article_dialog.dart';
import 'package:zaunfunk/features/article_comments/widgets/comment_widget.dart';
import 'package:zaunfunk/features/article_comments/widgets/empty_comment.dart';
import 'package:zaunfunk/features/authentication/models/user.dart';
import 'package:zaunfunk/features/shared/widgets/buttons/zf_elevated_button.dart';

import '../../repositories/database_repository.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen(
      {super.key,
      required this.article,
      required this.repository,
      required this.currentUser});
  final DatabaseRepository repository;
  final UserArticle article;
  final User currentUser;

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBeige,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
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
                          widget.currentUser.userName == widget.article.userName
                              ? true
                              : false,
                      child: IconButton.outlined(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => DeleteArticleDialog(
                                      repository: widget.repository,
                                      article: widget.article,
                                      currentUser: widget.currentUser,
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
                        backgroundImage:
                            AssetImage(widget.article.userImagePath),
                        radius: 24,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                          style: Theme.of(context).textTheme.titleMedium,
                          widget.article.userName == widget.currentUser.userName
                              ? 'Du'
                              : widget.article.userName),
                    )
                  ],
                ),
                const Divider(),
                SizedBox(
                  height: widget.article.articleImagePath == '' ? 8 : 240,
                  width: double.infinity,
                  child: widget.article.articleImagePath == ''
                      ? const Text('')
                      : Image.asset(
                          fit: BoxFit.cover, widget.article.articleImagePath),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8.0),
                  child: Text(
                      style: Theme.of(context).textTheme.bodyLarge,
                      widget.article.userArticle),
                ),
                const Divider(),
                SizedBox(
                    child: widget.article.articleComments.isEmpty
                        ? const EmptyComment()
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: widget.article.articleComments.length,
                            itemBuilder: (BuildContext context, int index) =>
                                CommentWidget(
                                    userName: widget.article
                                        .articleComments[index].userName,
                                    comment: widget
                                        .article
                                        .articleComments[index]
                                        .articleComment))),
                IconButton.outlined(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return CommentBottomSheet(
                            repository: widget.repository,
                            article: widget.article,
                            currentUser: widget.currentUser,
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.add_comment_outlined)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommentBottomSheet extends StatefulWidget {
  const CommentBottomSheet({
    super.key,
    required this.article,
    required this.currentUser,
    required this.repository,
  });
  final DatabaseRepository repository;
  final UserArticle article;
  final User currentUser;

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final TextEditingController _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: double.infinity,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Text(_commentController.text)),
            TextField(
              onChanged: (value) {
                setState(() {
                  _commentController.text;
                });
              },
              controller: _commentController,
            ),
            ZfElevatedButton(
                onPressed: () {
                  widget.article.addComment(
                      widget.currentUser.userName, _commentController.text);
                  setState(() {});
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ArticleScreen(
                              article: widget.article,
                              repository: widget.repository,
                              currentUser: widget.currentUser)));
                },
                text: 'Posten')
          ],
        ),
      )),
    );
  }
}
