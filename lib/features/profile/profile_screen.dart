import 'package:flutter/material.dart';
import 'package:zaunfunk/config/colors.dart';
import 'package:zaunfunk/features/profile/profile_grid_item.dart';
import 'package:zaunfunk/features/shared/widgets/zf_divider.dart';

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
              const ZfDivider(),
              Text(
                  style: Theme.of(context).textTheme.headlineSmall,
                  "Garten 82"),
              const ZfDivider(),
              const SizedBox(height: 16),
              GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: const [
                  ProfileGridItem(imagePath: "assets/images/ernte.png"),
                  ProfileGridItem(imagePath: "assets/images/floor.png"),
                  ProfileGridItem(imagePath: "assets/images/ernte.png"),
                  ProfileGridItem(imagePath: "assets/images/roses.png"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
