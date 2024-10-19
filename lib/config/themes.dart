import 'package:flutter/material.dart';
import 'package:zaunfunk/config/colors.dart';

ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: naturalBeige,
    fontFamily: "Roboto",
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontWeight: FontWeight.bold ,color:  gardenGreen),
      headlineMedium: TextStyle(fontWeight: FontWeight.bold ,color: gardenGreen),
      headlineSmall: TextStyle(color: gardenGreen),
      titleMedium: TextStyle(color: gardenGreen),
      bodyLarge: TextStyle(color: gardenGreen),
    ),
    iconTheme: const IconThemeData(color: gardenGreen),
    appBarTheme: const AppBarTheme(
        color: navBarBeige,
        elevation: 2,
        iconTheme: IconThemeData(color: gardenGreen)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: navBarBeige,
      
    ));
