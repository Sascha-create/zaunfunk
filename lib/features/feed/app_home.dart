import 'package:flutter/material.dart';
import 'package:zaunfunk/features/article/create_article_screen.dart';
import 'package:zaunfunk/features/feed/home_screen.dart';
import 'package:zaunfunk/features/profile/profile_screen.dart';
import 'package:zaunfunk/shared/config/colors.dart';
import 'package:zaunfunk/features/settings/settings_screen.dart';

class AppHome extends StatefulWidget {
  const AppHome({
    super.key,
  });

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(),
      CreateArticleScreen(),
      ProfileScreen(),
      SettingsScreen()
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: gardenGreen,
        title: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text("Zaunfunk"),
        ),
        actions: currentIndex == 0
            ? [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                    ))
              ]
            : null,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: NavigationBar(
          height: 64,
          selectedIndex: currentIndex,
          onDestinationSelected: (int index) {
            currentIndex = index;
            setState(() {});
          },
          backgroundColor: navBarBeige,
          indicatorColor: impulseGreen.withValues(alpha: .5),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: const [
            NavigationDestination(
                selectedIcon: Icon(
                  Icons.bungalow_outlined,
                  color: gardenGreen,
                  size: 34,
                ),
                icon: Icon(
                  Icons.bungalow_outlined,
                  color: gardenGreen,
                  size: 30,
                ),
                label: "Home"),
            NavigationDestination(
                selectedIcon: Icon(
                  Icons.add_box_outlined,
                  color: gardenGreen,
                  size: 34,
                ),
                icon: Icon(
                  Icons.add_box_outlined,
                  color: gardenGreen,
                  size: 30,
                ),
                label: "Beitrag"),
            NavigationDestination(
                selectedIcon: Icon(
                  Icons.account_circle,
                  color: gardenGreen,
                  size: 34,
                ),
                icon: Icon(
                  Icons.account_circle,
                  color: gardenGreen,
                  size: 30,
                ),
                label: "Profil"),
            NavigationDestination(
                selectedIcon: Icon(
                  Icons.settings,
                  color: gardenGreen,
                  size: 34,
                ),
                icon: Icon(
                  Icons.settings,
                  color: gardenGreen,
                  size: 30,
                ),
                label: "Profil"),
          ]),
    );
  }
}
