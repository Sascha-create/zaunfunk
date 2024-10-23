import 'package:flutter/material.dart';
import 'package:zaunfunk/screens/create_article_screen.dart';
import 'package:zaunfunk/screens/home_screen.dart';
import 'package:zaunfunk/screens/profile_screen.dart';
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

class _AppHomeState extends State<AppHome> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(repository: widget.repository),
      const CreateArticleScreen(),
      const ProfileScreen()
    ];
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
      body: screens[currentIndex],
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
