import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaunfunk/shared/config/colors.dart';
import 'package:zaunfunk/features/glowing_club_article/is_club_article_card.dart';
import 'package:zaunfunk/features/article/models/user_article.dart';
import 'package:zaunfunk/shared/repositories/database_repository.dart';

import '../authentication/models/zf_user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.currentUser,
  });

  final ZfUser currentUser;

  @override
  Widget build(BuildContext context) {
    late final Future<List<UserArticle>> futureArticles =
        context.read<DatabaseRepository>().getArticles();

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
                      currentUser: currentUser,
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
