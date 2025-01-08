import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaunfunk/features/authentication/logic/user_provider.dart';
import 'package:zaunfunk/shared/config/colors.dart';
import 'package:zaunfunk/features/article/models/user_article.dart';

class MemberArticle extends StatelessWidget {
  const MemberArticle({
    super.key,
    required this.article,
  });

  final UserArticle article;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: lightBeige,
          border: Border.all(color: Colors.grey, strokeAlign: 0.2),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
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
                  child: Consumer<UserProvider>(
                    builder: (context, provider, child) => Text(
                        style: Theme.of(context).textTheme.titleMedium,
                        article.authorId == provider.currentUser?.userId
                            ? 'Du'
                            : article.userName),
                  ),
                )
              ],
            ),
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Text(
                style: Theme.of(context).textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                article.userArticle),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.bookmark_outline),
                Row(
                  children: [
                    Icon(Icons.thumb_up_outlined),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
