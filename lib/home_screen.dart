import 'package:flutter/material.dart';
import 'package:zaunfunk/widgets/article_card.dart';
import 'package:zaunfunk/config/colors.dart';
import 'package:zaunfunk/repositories/database_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.repository,
  });

  final DatabaseRepository repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: gardenGreen,
        title: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text("Zaunfunk"),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ))
        ],
      ),
      body: Center(
        child: ArticleCard(repositroy: repository),
      ),
      bottomNavigationBar: NavigationBar(
          backgroundColor: navBarBeige,
          indicatorColor: impulseGreen.withOpacity(0.3),
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Icons.bungalow_outlined,
                  color: gardenGreen,
                  size: 32,
                ),
                label: "Home"),
            NavigationDestination(
                icon: Icon(
                  Icons.add_box_outlined,
                  color: gardenGreen,
                  size: 32,
                ),
                label: "Beitrag"),
            NavigationDestination(
                icon: Icon(
                  Icons.account_circle,
                  color: gardenGreen,
                  size: 32,
                ),
                label: "Profil"),
          ]),
    );
  }
}
