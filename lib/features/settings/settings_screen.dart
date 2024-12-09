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
            ],
          ),
        ),
      ),
    );
  }
}
