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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(userImagePath),
                radius: 9,
              ),
            ),
            Text(
              style: Theme.of(context).textTheme.bodyLarge,
              userName,
            ),
          ],
        ),
        Text(style: Theme.of(context).textTheme.bodyMedium, comment),
        const Divider()
      ],
    );
  }
}
