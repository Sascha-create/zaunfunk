import 'package:flutter/material.dart';
import 'package:zaunfunk/features/glowing_club_article/club_article.dart';
import 'package:zaunfunk/features/glowing_club_article/member_article.dart';
import 'package:zaunfunk/features/article/models/user_article.dart';
import 'package:zaunfunk/features/article/article_screen.dart';

import '../../repositories/database_repository.dart';
import '../authentication/models/user.dart';

class IsClubArticleCard extends StatelessWidget {
  const IsClubArticleCard({
    super.key,
     required this.repository,
    required this.article,
    required this.currentUser,
    required this.isClub, 
  });
  final DatabaseRepository repository;
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
                  repository: repository,
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
