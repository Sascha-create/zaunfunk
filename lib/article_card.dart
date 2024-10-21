import 'package:flutter/material.dart';
import 'package:zaunfunk/config/colors.dart';
import 'package:zaunfunk/models/user.dart';
import 'package:zaunfunk/repositories/database_repository.dart';

User user1 = User(
    userName: "Sascha",
    userPassword: "baum123",
    userImagePath: "assets/images/ich.jpeg");

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key, required this.repositroy});
  final DatabaseRepository repositroy;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(user1.userImagePath),
                    radius: 24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(user1.userName),
                )
              ],
            ),
          ),
          const Divider(),
          SizedBox(
            height: 240,
            width: double.infinity,
            child: Image.asset(fit: BoxFit.cover, "assets/images/ernte.png"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Text(
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."),
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
    );
  }
}
