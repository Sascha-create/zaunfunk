import 'package:flutter/material.dart';
import 'package:zaunfunk/config/themes.dart';
import 'package:zaunfunk/features/authentication/screens/login_screen.dart';
import 'package:zaunfunk/repositories/database_repository.dart';
import 'package:zaunfunk/repositories/mock_database.dart';

void main() {
  final DatabaseRepository repository = MockDatabase();
  runApp(MainApp(repository: repository,));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.repository});
  final DatabaseRepository repository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(
        repository: repository,
      ),
    );
  }
}
