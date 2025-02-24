import 'package:flutter/material.dart';
import 'package:zaunfunk/shared/config/colors.dart';

ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: naturalBeige,
    fontFamily: "Roboto",
    textTheme: TextTheme(
        headlineLarge:
            TextStyle(fontWeight: FontWeight.bold, color: gardenGreen),
        headlineMedium:
            TextStyle(fontWeight: FontWeight.bold, color: gardenGreen),
        headlineSmall: TextStyle(color: gardenGreen),
        titleMedium: TextStyle(color: gardenGreen),
        bodyLarge: TextStyle(color: Colors.black87),
        bodyMedium: TextStyle(color: Colors.grey.shade700)),
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
    bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: lightBeige, showDragHandle: true),
    listTileTheme: const ListTileThemeData(
      textColor: gardenGreen,
      iconColor: gardenGreen,
    ),
    snackBarTheme: const SnackBarThemeData(
        backgroundColor: gardenGreen,
        contentTextStyle: TextStyle(
          color: lightBeige,
        )));
