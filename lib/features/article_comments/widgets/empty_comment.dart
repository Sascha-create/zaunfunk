import 'package:flutter/material.dart';

class EmptyComment extends StatelessWidget {
  const EmptyComment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Kommentare'),
          Divider(),
        ],
      ),
    );
  }
}
