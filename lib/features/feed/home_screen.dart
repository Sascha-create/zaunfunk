import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaunfunk/features/authentication/logic/user_provider.dart';
import 'package:zaunfunk/features/authentication/models/zf_user.dart';
import 'package:zaunfunk/shared/config/colors.dart';
import 'package:zaunfunk/features/glowing_club_article/is_club_article_card.dart';
import 'package:zaunfunk/features/article/models/user_article.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ZfUser? currentUser = context.read<UserProvider>().currentUser;
    //final String clubId = currentUser!.clubId;
    Stream<QuerySnapshot> articleStream = FirebaseFirestore.instance
        .collection('clubs')
        .doc(currentUser!.clubId)
        .collection('articles')
        .orderBy('createTime', descending: true)
        .snapshots(includeMetadataChanges: true);

    return StreamBuilder(
      stream: articleStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active &&
            snapshot.hasData) {
          return Center(
            child: ListView(
              children: snapshot.data!.docs.map((document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                UserArticle article = UserArticle(
                    articleId: data['articleId'] ?? '',
                    userName: data['userName'] ?? '',
                    authorId: data['authorId'] ?? '',
                    userImagePath: data['userImagePath'] ??
                        'assets/images/splash_screen_logo.png',
                    userArticle: data['userArticle'] ?? '',
                    articleImagePath: data['articleImagePath'] ?? '',
                    isClub: data['isClub']);
                return IsClubArticleCard(
                    article: article, isClub: article.isClub);
              }).toList(),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.active &&
            snapshot.hasError) {
          return Text('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.active &&
            snapshot.data!.docs.isEmpty) {
          return Builder(builder: (context) {
            return Center(child: Text('Keine Beiträge vorhanden'));
          });
        }
        return const Center(
            child: CircularProgressIndicator(
          color: gardenGreen,
        ));
      },
    );
  }
}
