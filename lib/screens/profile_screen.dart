import 'package:flutter/material.dart';
import 'package:zaunfunk/config/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Stack(alignment: Alignment.center, children: [
                  Container(
                    width: 138,
                    height: 138,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: impulseGreen, style: BorderStyle.solid)),
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/ich.jpeg"),
                    radius: 64,
                  ),
                ]),
              ),
              Text(style: Theme.of(context).textTheme.headlineMedium, "Sascha"),
              const Divider(
                color: gardenGreen,
              ),
              Text(
                  style: Theme.of(context).textTheme.headlineSmall,
                  "Garten 82"),
              const Divider(
                color: gardenGreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
