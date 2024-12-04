import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget(
      {super.key, required this.userName, required this.comment});

  final String userName;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(userName), Text(comment),const Divider()],
    );
  }
}
