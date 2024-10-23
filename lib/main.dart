import 'package:flutter/material.dart';
import 'package:zaunfunk/config/themes.dart';
import 'package:zaunfunk/features/authentication/screens/login_screen.dart';
import 'package:zaunfunk/repositories/database_repository.dart';
import 'package:zaunfunk/repositories/mock_database.dart';


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
      home: LoginScreen(
        repository: repository,
      ),
    );
  }
}
