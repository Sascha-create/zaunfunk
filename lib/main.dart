import 'package:flutter/material.dart';
import 'package:zaunfunk/styles/colors.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
     appBar: AppBar(
          backgroundColor: navBarBeige,
          elevation: 2,
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
                  color: gardenGreen,
                ))
          ],
        ),
        backgroundColor: naturalBeige,
        body: const Center(
          child: Text('Hello World!'),
        ),
        bottomNavigationBar: NavigationBar(
            backgroundColor: navBarBeige,
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
