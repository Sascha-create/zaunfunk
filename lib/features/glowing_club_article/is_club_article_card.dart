import 'package:flutter/material.dart';
import 'package:zaunfunk/features/glowing_club_article/club_article.dart';
import 'package:zaunfunk/features/glowing_club_article/member_article.dart';
import 'package:zaunfunk/features/article/models/user_article.dart';
import 'package:zaunfunk/features/article/article_screen.dart';

import '../authentication/models/user.dart';

class IsClubArticleCard extends StatelessWidget {
  const IsClubArticleCard({
    super.key,
    required this.article,
    required this.currentUser,
    required this.isClub, 
  });
  final UserArticle article;
  final User currentUser;
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
        child: isClub
            ? ClubArticle(article: article, currentUser: currentUser)
            : MemberArticle(article: article, currentUser: currentUser),
      ),
    );
  }
}
