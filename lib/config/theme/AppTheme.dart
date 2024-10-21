import 'package:flutter/material.dart';
import 'package:myapplication/config/theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColours.primary,
    colorScheme: const ColorScheme.light(
      primary: AppColours.primary,
    ),
    scaffoldBackgroundColor: AppColours.lightBackground,
    brightness: Brightness.light,
    fontFamily: "Satoshi",
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      hintStyle: const TextStyle(
        color: Color(0xff383838),
        fontWeight: FontWeight.w500,
      ),
      contentPadding: const EdgeInsets.all(13),
      focusColor: AppColours.primary,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: Colors.black, width: 1),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: Colors.black, width: 1),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColours.textButtonLight,
        textStyle: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColours.primary,
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColours.primary,
    colorScheme: const ColorScheme.dark(
      primary: AppColours.primary,

    ),
    scaffoldBackgroundColor: AppColours.darkBackground,
    brightness: Brightness.dark,
    fontFamily: "Satoshi",
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      hintStyle: const TextStyle(
        color: Color(0xffA7A7A7),
        fontWeight: FontWeight.w500,
      ),
      contentPadding: const EdgeInsets.all(13),
      focusColor: AppColours.primary,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: Colors.white, width: 1),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: Colors.white, width: 1),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColours.textButtonDark,
        textStyle: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColours.primary,
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
    ),
  );
}
