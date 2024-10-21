import 'package:flutter/material.dart';
import 'package:zaunfunk/home_screen.dart';
import 'package:zaunfunk/models/user_article.dart';
import 'package:zaunfunk/profile_screen.dart';
import 'package:zaunfunk/widgets/article_card.dart';
import 'package:zaunfunk/config/colors.dart';
import 'package:zaunfunk/repositories/database_repository.dart';

class AppHome extends StatefulWidget {
  const AppHome({
    super.key,
    required this.repository,
  });

  final DatabaseRepository repository;

  @override
  State<AppHome> createState() => _AppHomeState();
}

//DatabaseRepository repository = repository;

class _AppHomeState extends State<AppHome> {
  //DatabaseRepository repository = widget.repository;

  int currentIndex = 0;
  // List<Widget> screens = [
  //   HomeScreen(repository: widget.repository),
  //   const ProfileScreen()
  // ];

  @override
  Widget build(BuildContext context) {
    //List<UserArticle> articles = repository.getArticles();
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
      body: HomeScreen(repository: widget.repository),
      bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (int index) {
            currentIndex = index;
            setState(() {});
          },
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
