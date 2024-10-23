import 'package:flutter/material.dart';
import 'package:zaunfunk/features/glowing_club_article/club_article.dart';
import 'package:zaunfunk/features/glowing_club_article/member_article.dart';
import 'package:zaunfunk/models/user_article.dart';
import 'package:zaunfunk/screens/article_screen.dart';

class IsClubArticleCard extends StatelessWidget {
  const IsClubArticleCard({super.key, required this.article, required this.isClub});
  final UserArticle article;
  final bool isClub;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleScreen(
                  article: article,
                ),
              ));
        },
        child: isClub ? ClubArticle(article: article) : MemberArticle(article: article),
      ),
    );
  }
}
