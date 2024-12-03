import 'package:flutter/material.dart';
import 'package:zaunfunk/config/colors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: naturalBeige,
  fontFamily: "Roboto",
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontWeight: FontWeight.bold, color: gardenGreen),
    headlineMedium: TextStyle(fontWeight: FontWeight.bold, color: gardenGreen),
    headlineSmall: TextStyle(color: gardenGreen),
    titleMedium: TextStyle(color: gardenGreen),
  ),
  iconTheme: const IconThemeData(color: gardenGreen),
  appBarTheme: const AppBarTheme(
      centerTitle: false,
      titleTextStyle: TextStyle(
          color: gardenGreen,
          fontFamily: "Roboto",
          fontSize: 30,
          fontWeight: FontWeight.bold),
      color: navBarBeige,
      elevation: 1,
      iconTheme: IconThemeData(color: gardenGreen, size: 32)),
);
