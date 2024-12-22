import 'package:flutter/material.dart';
import 'package:zaunfunk/shared/config/colors.dart';
import 'package:zaunfunk/features/article/models/user_article.dart';
import 'package:zaunfunk/features/article/delete_article_dialog.dart';
import 'package:zaunfunk/features/article_comments/widgets/comment_bottom_sheet.dart';
import 'package:zaunfunk/features/article_comments/widgets/comment_widget.dart';
import 'package:zaunfunk/features/article_comments/widgets/empty_comment.dart';
import 'package:zaunfunk/features/authentication/models/zf_user.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen(
      {super.key, required this.article, required this.currentUser});

  final UserArticle article;
  final ZfUser currentUser;

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  void initState() {
    super.initState();
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
                    height: MediaQuery.of(context).size.height * 0.34,
                    child: widget.article.articleComments.isEmpty
                        ? const EmptyComment()
                        : ListView.builder(
                            //physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: widget.article.articleComments.length,
                            itemBuilder: (BuildContext context, int index) =>
                                CommentWidget(
                                    userName: widget.article
                                        .articleComments[index].userName,
                                    userImagePath:
                                        widget.currentUser.userImagePath,
                                    comment: widget
                                        .article
                                        .articleComments[index]
                                        .articleComment))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton.outlined(
                      // durch async await wartet es bis das Sheet zu geht
                      onPressed: () async {
                        await showModalBottomSheet(
                          enableDrag: true,
                          context: context,
                          builder: (context) {
                            return CommentBottomSheet(
                              article: widget.article,
                              currentUser: widget.currentUser,
                            );
                          },
                        );
                        setState(() {});
                      },
                      icon: const Icon(Icons.add_comment_outlined)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
