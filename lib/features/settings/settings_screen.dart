import 'package:flutter/material.dart';
import 'package:zaunfunk/shared/widgets/zf_divider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                  style: Theme.of(context).textTheme.headlineLarge,
                  "Einstellungen"),
              const ZfDivider(),
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: const Text('Nutzername ändern'),
                    trailing: const Icon(Icons.arrow_right_rounded),
                    onTap: () {},
                  ),
                  const ZfDivider(),
                  ListTile(
                    title: const Text('Email ändern'),
                    trailing: const Icon(Icons.arrow_right_rounded),
                    onTap: () {},
                  ),
                  const ZfDivider(),
                  ListTile(
                    title: const Text('Passwort ändern'),
                    trailing: const Icon(Icons.arrow_right_rounded),
                    onTap: () {},
                  ),
                  const ZfDivider(),
                  ListTile(
                    title: const Text('Account löschen'),
                    trailing: const Icon(Icons.arrow_right_rounded),
                    onTap: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
