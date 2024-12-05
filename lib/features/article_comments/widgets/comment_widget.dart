import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget(
      {super.key,
      required this.userName,
      required this.comment,
      required this.userImagePath});

  final String userName;
  final String userImagePath;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(userImagePath),
                radius: 8,
              ),
            ),
            Text(userName),
          ],
        ),
        Text(comment),
        const Divider()
      ],
    );
  }
}
