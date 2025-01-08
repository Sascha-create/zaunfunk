import 'package:flutter/material.dart';
import 'package:zaunfunk/features/authentication/screens/join_club_screen.dart';
import 'package:zaunfunk/shared/config/colors.dart';
import '../../../shared/widgets/buttons/zf_elevated_button.dart';
import '../screens/create_club_profile_screen.dart';

class RegistrationDialog extends StatelessWidget {
  const RegistrationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: navBarBeige,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(size: 32, Icons.close))
            ],
          ),
          Text(
              style: Theme.of(context).textTheme.headlineMedium,
              "Registrierung"),
          const SizedBox(height: 16),
          Text(
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
              "Möchtest du Dich als Verein oder als Mitglied in einem verein anmelden ?"),
          const SizedBox(height: 40),
          ZfElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => JoinClubScreen()));
              },
              text: "Mitglied"),
          ZfElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateClubProfileScreen()));
              },
              text: "Verein"),
        ],
      ),
    );
  }
}
