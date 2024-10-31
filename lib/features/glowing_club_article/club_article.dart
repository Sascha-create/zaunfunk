import 'package:flutter/material.dart';
import 'package:zaunfunk/config/colors.dart';
import 'package:zaunfunk/features/article/models/user_article.dart';

class ClubArticle extends StatelessWidget {
  const ClubArticle({
    super.key,
    required this.article,
  });

  final UserArticle article;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: lightBeige,
          boxShadow: const [BoxShadow(
            color: impulseGreen,
            blurRadius: 4,
            spreadRadius: 1,
            offset: Offset(0.5, 2)
          )],
          border: Border.all(color: impulseGreen, strokeAlign: 1),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/ich.jpeg"),
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
          ),
          const Divider(),
          SizedBox(
            height: 240,
            width: double.infinity,
            child: Image.asset(fit: BoxFit.cover, article.articleImagePath),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Text(
                style: Theme.of(context).textTheme.bodyMedium,
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
                    SizedBox(
                      width: 24,
                    ),
                    Icon(Icons.add_comment_outlined),
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
