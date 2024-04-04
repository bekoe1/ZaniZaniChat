import 'package:flutter/material.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white12,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white70,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(color: Colors.red, width: 3),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(color: Colors.transparent, width: 3),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Colors.white54,
      contentTextStyle: TextStyle(
        color: Colors.white12
      ),
    ),
  );
}