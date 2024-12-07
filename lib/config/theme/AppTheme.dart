import 'package:flutter/material.dart';
import 'package:habitar/config/theme/theme.dart';

class AppTheme {
  static final lightColourScheme = MaterialTheme.lightMediumContrastScheme();
  static final darkColourScheme = MaterialTheme.darkScheme();
  static final lightTheme = ThemeData(
    // primaryColor: AppColours.primary,
    // colorScheme: const ColorScheme.light(
    //     primary: AppColours.primary, secondary: AppColours.secondary),
    useMaterial3: true,
    colorScheme: lightColourScheme,
    brightness: lightColourScheme.brightness,
    fontFamily: "Domine",
    // textTheme: const TextTheme(
    //   // bodySmall: TextStyle(color: AppColours.primary),
    //   // bodyMedium: TextStyle(color: AppColours.primary),
    //   // bodyLarge: TextStyle(color: AppColours.primary),
    // ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      // //   hintStyle: TextStyle(
      // //     // color: AppColours.primary,
      // //     fontWeight: FontWeight.w500,
      // //   ),
      // //   // focusColor: AppColours.primary,
    ),
    // textButtonTheme: TextButtonThemeData(
    //   style: TextButton.styleFrom(
    //     foregroundColor: AppColours.textButtonLight,
    //     textStyle: const TextStyle(
    //       fontSize: 16,
    //       fontWeight: FontWeight.w500,
    //     ),
    //   ),
    // ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // backgroundColor: Colors.transparent,
        //     textStyle: const TextStyle(
        //       fontSize: 16,
        //       fontWeight: FontWeight.bold,
        //     ),
        minimumSize: const Size.fromHeight(48),
        //     side: const BorderSide(color: AppColours.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightColourScheme.primaryContainer,
        textStyle: TextStyle(
            //     //   fontSize: 16,
            //     //   fontWeight: FontWeight.bold,
            color: lightColourScheme.onPrimaryContainer),
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    // primaryColor: AppColours.primary,
    // colorScheme: const ColorScheme.dark(
    //     primary: AppColours.primary, secondary: AppColours.secondary),
    useMaterial3: true,
    colorScheme: darkColourScheme,
    brightness: darkColourScheme.brightness,
    fontFamily: "Domine",
    // textTheme: const TextTheme(
    //   // bodySmall: TextStyle(color: AppColours.primary),
    //   // bodyMedium: TextStyle(color: AppColours.primary),
    //   // bodyLarge: TextStyle(color: AppColours.primary),
    // ),
    inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    )
        //   hintStyle: TextStyle(
        //     color: AppColours.primary,
        //     fontWeight: FontWeight.w500,
        //   ),
        //   focusColor: AppColours.primary,
        ),
    // textButtonTheme: TextButtonThemeData(
    //   style: TextButton.styleFrom(
    //     foregroundColor: AppColours.textButtonDark,
    //     textStyle: const TextStyle(
    //       fontSize: 16,
    //       fontWeight: FontWeight.w500,
    //     ),
    //   ),
    // ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        // textStyle: const TextStyle(
        //       fontSize: 16,
        //       fontWeight: FontWeight.bold,
        //     ),
        minimumSize: const Size.fromHeight(48),
        //     side: const BorderSide(color: AppColours.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkColourScheme.primaryContainer,
        textStyle: TextStyle(
            //       fontSize: 16,
            //       fontWeight: FontWeight.bold,
            color: darkColourScheme.onPrimaryContainer),
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
