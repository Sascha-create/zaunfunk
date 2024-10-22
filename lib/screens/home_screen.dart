import 'package:flutter/material.dart';
import 'package:zaunfunk/models/user_article.dart';
import 'package:zaunfunk/repositories/database_repository.dart';
import 'package:zaunfunk/widgets/article_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.repository,
  });

  final DatabaseRepository repository;

  @override
  Widget build(BuildContext context) {
    List<UserArticle> articles = repository.getArticles();
    return Center(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: articles.length,
          itemBuilder: (BuildContext context, int index) => ArticleCard(
                article: articles[index],
              )),
    );
  }
}
