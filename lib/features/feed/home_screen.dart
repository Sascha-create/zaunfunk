import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaunfunk/shared/config/colors.dart';
import 'package:zaunfunk/features/glowing_club_article/is_club_article_card.dart';
import 'package:zaunfunk/features/article/models/user_article.dart';
import 'package:zaunfunk/shared/repositories/database_repository.dart';

import '../authentication/models/zf_user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.currentUser,
  });

  final ZfUser currentUser;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // late final Future<List<UserArticle>> futureArticles =
    //     context.read<DatabaseRepository>().getArticles();

    Stream<QuerySnapshot> articleStream = FirebaseFirestore.instance
        .collection('articles')
        .orderBy('createTime', descending: true)
        .snapshots(includeMetadataChanges: true);

    bool isClub = false;

    return StreamBuilder(
      stream: articleStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active &&
            snapshot.hasData) {
          return Center(
            child: ListView(
              children: snapshot.data!.docs.map((document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                UserArticle article = UserArticle(
                    userName: data['userName'],
                    userImagePath: data['userImagePath'],
                    userArticle: data['userArticle'],
                    articleImagePath: data['articleImagePath'],
                    articleComments: []);
                return IsClubArticleCard(
                    article: article,
                    currentUser: widget.currentUser,
                    isClub: isClub);
              }).toList(),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.active &&
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
