import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaunfunk/features/article/repositories/article_repository.dart';
import 'package:zaunfunk/features/article/repositories/firestore_article_repository.dart';
import 'package:zaunfunk/firebase_options.dart';
import 'package:zaunfunk/shared/config/themes.dart';
import 'package:zaunfunk/features/authentication/screens/login_screen.dart';
import 'package:zaunfunk/features/authentication/repositories/auth_repository.dart';
import 'package:zaunfunk/shared/repositories/database_repository.dart';
import 'package:zaunfunk/features/authentication/repositories/firebase_auth_repository.dart';
import 'package:zaunfunk/shared/repositories/mock_database.dart';
import 'package:zaunfunk/shared/repositories/shared_preferences_repository.dart';
import 'package:zaunfunk/starting_app.dart';

// com.example.zaunfunk  muss vor eventuellem hochladen geändert werden !

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    Provider<DatabaseRepository>(create: (context) => MockDatabase()),
    Provider<AuthRepository>(create: (context) => FirebaseAuthRepository()),
    Provider<ArticleRepository>(
        create: (context) => FirestoreArticleRepository()),
        Provider<SharedPreferencesRepository>(create: (context) => SharedPreferencesRepository()),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: const StartingApp(),
    );
  }
}
