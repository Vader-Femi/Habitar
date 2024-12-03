import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff6c538c),
      surfaceTint: Color(0xff6c538c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffeedcff),
      onPrimaryContainer: Color(0xff260d44),
      secondary: Color(0xff904a45),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdad6),
      onSecondaryContainer: Color(0xff3b0908),
      tertiary: Color(0xff705289),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfff1daff),
      onTertiaryContainer: Color(0xff290c41),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff7ff),
      onSurface: Color(0xff1d1a20),
      onSurfaceVariant: Color(0xff4a454e),
      outline: Color(0xff7b757f),
      outlineVariant: Color(0xffccc4cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff332f35),
      inversePrimary: Color(0xffd7bafb),
      primaryFixed: Color(0xffeedcff),
      onPrimaryFixed: Color(0xff260d44),
      primaryFixedDim: Color(0xffd7bafb),
      onPrimaryFixedVariant: Color(0xff533b72),
      secondaryFixed: Color(0xffffdad6),
      onSecondaryFixed: Color(0xff3b0908),
      secondaryFixedDim: Color(0xffffb3ad),
      onSecondaryFixedVariant: Color(0xff73332f),
      tertiaryFixed: Color(0xfff1daff),
      onTertiaryFixed: Color(0xff290c41),
      tertiaryFixedDim: Color(0xffddb9f8),
      onTertiaryFixedVariant: Color(0xff573a70),
      surfaceDim: Color(0xffdfd8e0),
      surfaceBright: Color(0xfffff7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f1f9),
      surfaceContainer: Color(0xfff3ecf4),
      surfaceContainerHigh: Color(0xffede6ee),
      surfaceContainerHighest: Color(0xffe7e0e8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4f376e),
      surfaceTint: Color(0xff6c538c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff8369a4),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff6e2f2c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffaa5f5a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff53366b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff8768a1),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff7ff),
      onSurface: Color(0xff1d1a20),
      onSurfaceVariant: Color(0xff46414a),
      outline: Color(0xff635d66),
      outlineVariant: Color(0xff7f7882),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff332f35),
      inversePrimary: Color(0xffd7bafb),
      primaryFixed: Color(0xff8369a4),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff695189),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xffaa5f5a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff8d4843),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff8768a1),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff6e4f86),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdfd8e0),
      surfaceBright: Color(0xfffff7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f1f9),
      surfaceContainer: Color(0xfff3ecf4),
      surfaceContainerHigh: Color(0xffede6ee),
      surfaceContainerHighest: Color(0xffe7e0e8),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2d154b),
      surfaceTint: Color(0xff6c538c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4f376e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff440f0e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6e2f2c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff301448),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff53366b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff7ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff26222a),
      outline: Color(0xff46414a),
      outlineVariant: Color(0xff46414a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff332f35),
      inversePrimary: Color(0xfff5e7ff),
      primaryFixed: Color(0xff4f376e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff382156),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6e2f2c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff521a18),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff53366b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3c1f53),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdfd8e0),
      surfaceBright: Color(0xfffff7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f1f9),
      surfaceContainer: Color(0xfff3ecf4),
      surfaceContainerHigh: Color(0xffede6ee),
      surfaceContainerHighest: Color(0xffe7e0e8),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd7bafb),
      surfaceTint: Color(0xffd7bafb),
      onPrimary: Color(0xff3c255a),
      primaryContainer: Color(0xff533b72),
      onPrimaryContainer: Color(0xffeedcff),
      secondary: Color(0xffffb3ad),
      onSecondary: Color(0xff571e1b),
      secondaryContainer: Color(0xff73332f),
      onSecondaryContainer: Color(0xffffdad6),
      tertiary: Color(0xffddb9f8),
      onTertiary: Color(0xff402357),
      tertiaryContainer: Color(0xff573a70),
      onTertiaryContainer: Color(0xfff1daff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff151218),
      onSurface: Color(0xffe7e0e8),
      onSurfaceVariant: Color(0xffccc4cf),
      outline: Color(0xff958e99),
      outlineVariant: Color(0xff4a454e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e0e8),
      inversePrimary: Color(0xff6c538c),
      primaryFixed: Color(0xffeedcff),
      onPrimaryFixed: Color(0xff260d44),
      primaryFixedDim: Color(0xffd7bafb),
      onPrimaryFixedVariant: Color(0xff533b72),
      secondaryFixed: Color(0xffffdad6),
      onSecondaryFixed: Color(0xff3b0908),
      secondaryFixedDim: Color(0xffffb3ad),
      onSecondaryFixedVariant: Color(0xff73332f),
      tertiaryFixed: Color(0xfff1daff),
      onTertiaryFixed: Color(0xff290c41),
      tertiaryFixedDim: Color(0xffddb9f8),
      onTertiaryFixedVariant: Color(0xff573a70),
      surfaceDim: Color(0xff151218),
      surfaceBright: Color(0xff3b383e),
      surfaceContainerLowest: Color(0xff100d12),
      surfaceContainerLow: Color(0xff1d1a20),
      surfaceContainer: Color(0xff211e24),
      surfaceContainerHigh: Color(0xff2c292f),
      surfaceContainerHighest: Color(0xff373339),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffdcbeff),
      surfaceTint: Color(0xffd7bafb),
      onPrimary: Color(0xff20073e),
      primaryContainer: Color(0xffa085c2),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffb9b3),
      onSecondary: Color(0xff330405),
      secondaryContainer: Color(0xffcc7b74),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffe1bdfc),
      onTertiary: Color(0xff24063b),
      tertiaryContainer: Color(0xffa584bf),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff151218),
      onSurface: Color(0xfffff9fc),
      onSurfaceVariant: Color(0xffd0c8d3),
      outline: Color(0xffa8a0ab),
      outlineVariant: Color(0xff87818b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e0e8),
      inversePrimary: Color(0xff543d74),
      primaryFixed: Color(0xffeedcff),
      onPrimaryFixed: Color(0xff1b0239),
      primaryFixedDim: Color(0xffd7bafb),
      onPrimaryFixedVariant: Color(0xff422b60),
      secondaryFixed: Color(0xffffdad6),
      onSecondaryFixed: Color(0xff2c0102),
      secondaryFixedDim: Color(0xffffb3ad),
      onSecondaryFixedVariant: Color(0xff5e2320),
      tertiaryFixed: Color(0xfff1daff),
      onTertiaryFixed: Color(0xff1e0136),
      tertiaryFixedDim: Color(0xffddb9f8),
      onTertiaryFixedVariant: Color(0xff46295e),
      surfaceDim: Color(0xff151218),
      surfaceBright: Color(0xff3b383e),
      surfaceContainerLowest: Color(0xff100d12),
      surfaceContainerLow: Color(0xff1d1a20),
      surfaceContainer: Color(0xff211e24),
      surfaceContainerHigh: Color(0xff2c292f),
      surfaceContainerHighest: Color(0xff373339),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9fc),
      surfaceTint: Color(0xffd7bafb),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffdcbeff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9f9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffb9b3),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9fb),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffe1bdfc),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff151218),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffff9fc),
      outline: Color(0xffd0c8d3),
      outlineVariant: Color(0xffd0c8d3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e0e8),
      inversePrimary: Color(0xff351e53),
      primaryFixed: Color(0xfff1e1ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffdcbeff),
      onPrimaryFixedVariant: Color(0xff20073e),
      secondaryFixed: Color(0xffffe0dd),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffb9b3),
      onSecondaryFixedVariant: Color(0xff330405),
      tertiaryFixed: Color(0xfff4e0ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffe1bdfc),
      onTertiaryFixedVariant: Color(0xff24063b),
      surfaceDim: Color(0xff151218),
      surfaceBright: Color(0xff3b383e),
      surfaceContainerLowest: Color(0xff100d12),
      surfaceContainerLow: Color(0xff1d1a20),
      surfaceContainer: Color(0xff211e24),
      surfaceContainerHigh: Color(0xff2c292f),
      surfaceContainerHighest: Color(0xff373339),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  // List<ExtendedColor> get extendedColors => [
  // ];
}
