import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.deepPurple;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    // textTheme: lightTextTheme,
  );

  // static const TextTheme lightTextTheme = TextTheme();

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    // textTheme: darkTextTheme,
  );

  // static const TextTheme darkTextTheme = TextTheme();
}
