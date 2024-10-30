import 'package:flutter/material.dart';
import 'package:zaunfunk/features/glowing_club_article/is_club_article_card.dart';
import 'package:zaunfunk/models/user_article.dart';
import 'package:zaunfunk/repositories/database_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.repository,
  });

  final DatabaseRepository repository;

  @override
  Widget build(BuildContext context) {
    List<UserArticle> articles = repository.getArticles();
    bool isClub = false;
    return Center(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: articles.length,
          itemBuilder: (BuildContext context, int index) => IsClubArticleCard(
                article: articles[index],
                isClub: isClub,
              )),
    );
  }
}
