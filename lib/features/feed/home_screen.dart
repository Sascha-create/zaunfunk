import 'package:flutter/material.dart';
import 'package:zaunfunk/config/colors.dart';
import 'package:zaunfunk/features/glowing_club_article/is_club_article_card.dart';
import 'package:zaunfunk/features/article/models/user_article.dart';
import 'package:zaunfunk/repositories/database_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.repository,
  });

  final DatabaseRepository repository;

  @override
  Widget build(BuildContext context) {
    late final Future<List<UserArticle>> futureArticles =
        repository.getArticles();
    bool isClub = false;
    return FutureBuilder(
      future: futureArticles,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          final List<UserArticle> articles = snapshot.data!;
          return Center(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: articles.length,
                itemBuilder: (BuildContext context, int index) =>
                    IsClubArticleCard(
                      article: articles[index],
                      isClub: isClub,
                    )),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasError) {
          return const Icon(
            Icons.error,
            size: 48,
            color: Colors.red,
          );
        }
        return const Center(
            child: CircularProgressIndicator(
          color: gardenGreen,
        ));
      },
    );
  }
}
