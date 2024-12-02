import 'package:flutter/material.dart';
import 'package:zaunfunk/config/colors.dart';
import 'package:zaunfunk/features/profile/logout_dialog.dart';
import 'package:zaunfunk/features/profile/profile_grid_item.dart';
import 'package:zaunfunk/features/shared/widgets/zf_divider.dart';
import 'package:zaunfunk/repositories/database_repository.dart';

import '../authentication/models/user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.currentUser, required this.repository});

  final User currentUser;
  final DatabaseRepository repository;

  @override
  Widget build(BuildContext context) {
    User loggedInUser = User(
        userId: currentUser.userId,
        userName: currentUser.userName,
        userPassword: currentUser.userPassword,
        aboutMe: currentUser.aboutMe,
        userImagePath: currentUser.userImagePath);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton.outlined(
                          onPressed: () {
                            showDialog(
                          context: context,
                          builder: (context) => LogoutDialog(
                                repository: repository,
                                currentUser: currentUser,
                              ));
                          },
                          icon: const Icon(Icons.logout_rounded))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Stack(alignment: Alignment.center, children: [
                    Container(
                      width: 138,
                      height: 138,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: impulseGreen, style: BorderStyle.solid)),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage(loggedInUser.userImagePath),
                      radius: 64,
                    ),
                  ]),
                ),
                Text(
                    style: Theme.of(context).textTheme.headlineMedium,
                    loggedInUser.userName),
                const ZfDivider(),
                Text(
                    style: Theme.of(context).textTheme.headlineSmall,
                    loggedInUser.aboutMe),
                const ZfDivider(),
                const SizedBox(height: 16),
                GridView(
                  physics: const NeverScrollableScrollPhysics(),
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
      ),
    );
  }
}
