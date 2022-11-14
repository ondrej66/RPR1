import 'package:flutter/material.dart';

ThemeData yellowTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,

  appBarTheme: const AppBarTheme(
    foregroundColor: Colors.white,
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.amber,
  ),

);


ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.dark,

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.amber,
  ),
);
