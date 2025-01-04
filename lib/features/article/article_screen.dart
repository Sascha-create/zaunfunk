import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaunfunk/features/article_comments/models/article_comment.dart';
import 'package:zaunfunk/features/authentication/logic/user_provider.dart';
import 'package:zaunfunk/shared/config/colors.dart';
import 'package:zaunfunk/features/article/models/user_article.dart';
import 'package:zaunfunk/features/article/delete_article_dialog.dart';
import 'package:zaunfunk/features/article_comments/widgets/comment_bottom_sheet.dart';
import 'package:zaunfunk/features/article_comments/widgets/comment_widget.dart';
import 'package:zaunfunk/features/article_comments/widgets/empty_comment.dart';
import 'package:zaunfunk/features/authentication/models/zf_user.dart';
import 'package:zaunfunk/shared/widgets/buttons/zf_icon_outlined_button.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key, required this.article});

  final UserArticle article;

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> commentStream = FirebaseFirestore.instance
        .collection('articles')
        .doc(widget.article.articleId)
        .collection('comments')
        .orderBy('createTime', descending: false)
        .snapshots(includeMetadataChanges: true);

    final ZfUser? currentUser = context.watch<UserProvider>().currentUser;

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
                    Row(
                      children: [
                        Visibility(
                          visible: currentUser?.userId ==
                                  widget.article.authorId
                              ? true
                              : false,
                          child: ZfIconOutlinedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => DeleteArticleDialog(
                                          article: widget.article,
                                          
                                        ));
                              },
                              icon: Icons.delete_forever),
                        ),
                        ZfIconOutlinedButton(
                            onPressed: () async {
                              await showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return CommentBottomSheet(
                                    article: widget.article,
                                    
                                  );
                                },
                              );
                            },
                            icon: Icons.add_comment_outlined),
                      ],
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
                          widget.article.authorId == currentUser?.userId
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
                Center(
                    child: Text(
                        style: Theme.of(context).textTheme.titleMedium,
                        'Kommentare')),
                const Divider(),
                StreamBuilder(
                  stream: commentStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active &&
                        snapshot.hasData) {
                      return Center(
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: snapshot.data!.docs.map((document) {
                            Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;
                            ArticleComment comment = ArticleComment(
                                userName: data['userName'],
                                userImagePath: data['userImagePath'],
                                articleComment: data['comment']);
                            return CommentWidget(
                                userName: comment.userName,
                                comment: comment.articleComment,
                                userImagePath: comment.userImagePath);
                          }).toList(),
                        ),
                      );
                    } else if (snapshot.connectionState ==
                            ConnectionState.active &&
                        snapshot.hasError) {
                      return const Icon(
                        Icons.error,
                        size: 48,
                        color: Colors.red,
                      );
                    }
                    return const Center(child: EmptyComment());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
