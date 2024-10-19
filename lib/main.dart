import 'package:flutter/material.dart';
import 'package:zaunfunk/config/themes.dart';
import 'package:zaunfunk/models/user.dart';
import 'package:zaunfunk/repositories/database_repository.dart';
import 'package:zaunfunk/repositories/mock_database.dart';
import 'package:zaunfunk/config/colors.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final DatabaseRepository repository = MockDatabase();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: Scaffold(
        appBar: AppBar(
          shadowColor: gardenGreen,
          title: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: gardenGreen),
                "Zaunfunk"),
          ),
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 32,
                ))
          ],
        ),
        body: Center(
          child: ArticleCard(repositroy: repository),
        ),
        bottomNavigationBar: NavigationBar(
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
      ),
    );
  }
}

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
      constraints:
          const BoxConstraints(minHeight: double.minPositive, maxHeight: 300),
      child: Card(
        color: lightBeige,
        elevation: 0,
        child: Column(
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
            Text(
                style: Theme.of(context).textTheme.headlineMedium,
                "HAllo Test 123 test123")
          ],
        ),
      ),
    );
  }
}
