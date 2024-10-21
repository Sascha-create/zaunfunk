import 'package:flutter/material.dart';
import 'package:zaunfunk/widgets/zf_elevated_button.dart';
import 'package:zaunfunk/widgets/zf_icon_button.dart';
import 'package:zaunfunk/widgets/zf_textfield.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            children: [
              Text(
                  style: Theme.of(context).textTheme.headlineMedium,
                  "Nutzerprofil erstellen"),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Stack(clipBehavior: Clip.none, children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/ich.jpeg"),
                    radius: 64,
                  ),
                  Positioned(bottom: -8, right: -16, child: ZfIconButton())
                ]),
              ),
              Row(
                children: [
                  const Text("Box"),
                  Text(
                      style: Theme.of(context).textTheme.headlineSmall,
                      "Verein"),
                ],
              ),
              Row(
                children: [
                  const Text("Box"),
                  Text(
                      style: Theme.of(context).textTheme.headlineSmall,
                      "Mitglied"),
                ],
              ),
              const ZfTextfield(labelText: "Vorname"),
              const ZfTextfield(labelText: "Nachname"),
              const ZfTextfield(labelText: "Geburtsdatum"),
              const ZfTextfield(labelText: "Über mich"),
              ZfElevatedButton(onPressed: () {}, text: "Registrieren")
            ],
          ),
        ),
      )),
    );
  }
}
