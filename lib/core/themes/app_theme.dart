import 'package:flutter/material.dart';
import '../style/app_styles.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    //светлая тема
    fontFamily: 'Heuristica',
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal,
      brightness: Brightness.light,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: AppStyles.mainPadding,
      border: OutlineInputBorder(
        borderRadius: AppStyles.mainBorder,
      ),
    ),
  );

  static final darkhtTheme = ThemeData(
    //темная тема
    fontFamily: 'Heuristica',
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal,
      brightness: Brightness.dark,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: AppStyles.mainPadding,
      border: OutlineInputBorder(
        borderRadius: AppStyles.mainBorder,
      ),
    ),
  );
}
