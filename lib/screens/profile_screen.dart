import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/ich.jpeg"),
              radius: 64,
            ),
            Text(style: Theme.of(context).textTheme.headlineMedium, "Sascha"),
          ],
        ),
      ),
    );
  }
}
