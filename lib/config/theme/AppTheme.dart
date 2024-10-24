import 'package:flutter/material.dart';
import 'package:myapplication/config/theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColours.primary,
    colorScheme: const ColorScheme.light(
        primary: AppColours.primary, secondary: AppColours.secondary),
    scaffoldBackgroundColor: AppColours.lightBackground,
    brightness: Brightness.light,
    fontFamily: "Domine",
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: AppColours.primary),
      bodyMedium: TextStyle(color: AppColours.primary),
      bodyLarge: TextStyle(color: AppColours.primary),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        color: AppColours.primary,
        fontWeight: FontWeight.w500,
      ),
      focusColor: AppColours.primary,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColours.textButtonLight,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        minimumSize: const Size.fromHeight(48),
        side: const BorderSide(color: AppColours.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColours.secondary,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColours.primary,
    colorScheme: const ColorScheme.dark(
        primary: AppColours.primary, secondary: AppColours.secondary),
    scaffoldBackgroundColor: AppColours.darkBackground,
    brightness: Brightness.dark,
    fontFamily: "Domine",
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: AppColours.primary),
      bodyMedium: TextStyle(color: AppColours.primary),
      bodyLarge: TextStyle(color: AppColours.primary),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        color: AppColours.primary,
        fontWeight: FontWeight.w500,
      ),
      focusColor: AppColours.primary,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColours.textButtonDark,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        minimumSize: const Size.fromHeight(48),
        side: const BorderSide(color: AppColours.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColours.secondary,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
