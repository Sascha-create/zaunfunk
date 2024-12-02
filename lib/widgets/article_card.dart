import 'package:flutter/material.dart';
import 'package:zaunfunk/config/colors.dart';
import 'package:zaunfunk/features/article/models/user_article.dart';


// Diese Klasse wird wahrscheinlich noch gelöscht!!

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key, required this.article});
  final UserArticle article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => ArticleScreen(
          //         article: article,
          //       ),
          //     ));
        },
        child: Container(
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
        ),
      ),
    );
  }
}
