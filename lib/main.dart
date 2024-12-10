import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zaunfunk/firebase_options.dart';
import 'package:zaunfunk/shared/config/themes.dart';
import 'package:zaunfunk/features/authentication/screens/login_screen.dart';
import 'package:zaunfunk/shared/repositories/database_repository.dart';
import 'package:zaunfunk/shared/repositories/mock_database.dart';

// com.example.zaunfunk  muss vor eventuellem hochladen geändert werden !


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final DatabaseRepository repository = MockDatabase();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
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
