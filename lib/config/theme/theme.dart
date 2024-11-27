import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff6c538c),
      surfaceTint: Color(0xff6c538c),
      onPrimary: Color(4294967295),
      primaryContainer: Color(0xffeedcff),
      onPrimaryContainer: Color(0xff260d44),
      secondary: Color(4287646277),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294957782),
      onSecondaryContainer: Color(4282059016),
      tertiary: Color(4285551241),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294040319),
      onTertiaryContainer: Color(4280880193),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294965247),
      onSurface: Color(0xff1d1a20),
      onSurfaceVariant: Color(4283057486),
      outline: Color(0xff7b757f),
      outlineVariant: Color(0xffccc4cf),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281544501),
      inversePrimary: Color(4292328187),
      primaryFixed: Color(4293844223),
      onPrimaryFixed: Color(4280683844),
      primaryFixedDim: Color(4292328187),
      onPrimaryFixedVariant: Color(4283644786),
      secondaryFixed: Color(4294957782),
      onSecondaryFixed: Color(4282059016),
      secondaryFixedDim: Color(4294947757),
      onSecondaryFixedVariant: Color(4285739823),
      tertiaryFixed: Color(4294040319),
      onTertiaryFixed: Color(4280880193),
      tertiaryFixedDim: Color(4292721144),
      onTertiaryFixedVariant: Color(4283906672),
      surfaceDim: Color(4292860128),
      surfaceBright: Color(4294965247),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294570489),
      surfaceContainer: Color(4294175988),
      surfaceContainerHigh: Color(4293781230),
      surfaceContainerHighest: Color(4293386472),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4283381614),
      surfaceTint: Color(4285289356),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4286802340),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4285411116),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4289355610),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4283643499),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4287064225),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965247),
      onSurface: Color(4280097312),
      onSurfaceVariant: Color(4282794314),
      outline: Color(4284702054),
      outlineVariant: Color(4286544002),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281544501),
      inversePrimary: Color(4292328187),
      primaryFixed: Color(4286802340),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4285092233),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4289355610),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4287449155),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4287064225),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4285419398),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292860128),
      surfaceBright: Color(4294965247),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294570489),
      surfaceContainer: Color(4294175988),
      surfaceContainerHigh: Color(4293781230),
      surfaceContainerHighest: Color(4293386472),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281144651),
      surfaceTint: Color(4285289356),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283381614),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282650382),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285411116),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281341000),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283643499),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965247),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280689194),
      outline: Color(4282794314),
      outlineVariant: Color(4282794314),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281544501),
      inversePrimary: Color(4294305791),
      primaryFixed: Color(4283381614),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281868630),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285411116),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283570712),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283643499),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282130259),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292860128),
      surfaceBright: Color(4294965247),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294570489),
      surfaceContainer: Color(4294175988),
      surfaceContainerHigh: Color(4293781230),
      surfaceContainerHighest: Color(4293386472),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4292328187),
      surfaceTint: Color(4292328187),
      onPrimary: Color(4282131802),
      primaryContainer: Color(0xff533b72),
      onPrimaryContainer: Color(4293844223),
      secondary: Color(4294947757),
      onSecondary: Color(4283899419),
      secondaryContainer: Color(4285739823),
      onSecondaryContainer: Color(4294957782),
      tertiary: Color(4292721144),
      onTertiary: Color(4282393431),
      tertiaryContainer: Color(4283906672),
      onTertiaryContainer: Color(4294040319),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279570968),
      onSurface: Color(4293386472),
      onSurfaceVariant: Color(4291609807),
      outline: Color(4287991449),
      outlineVariant: Color(0xff4a454e),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293386472),
      inversePrimary: Color(4285289356),
      primaryFixed: Color(4293844223),
      onPrimaryFixed: Color(4280683844),
      primaryFixedDim: Color(4292328187),
      onPrimaryFixedVariant: Color(4283644786),
      secondaryFixed: Color(4294957782),
      onSecondaryFixed: Color(4282059016),
      secondaryFixedDim: Color(4294947757),
      onSecondaryFixedVariant: Color(4285739823),
      tertiaryFixed: Color(4294040319),
      onTertiaryFixed: Color(4280880193),
      tertiaryFixedDim: Color(4292721144),
      onTertiaryFixedVariant: Color(4283906672),
      surfaceDim: Color(4279570968),
      surfaceBright: Color(4282071102),
      surfaceContainerLowest: Color(4279242002),
      surfaceContainerLow: Color(4280097312),
      surfaceContainer: Color(4280360484),
      surfaceContainerHigh: Color(4281084207),
      surfaceContainerHighest: Color(4281807673),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4292656895),
      surfaceTint: Color(4292328187),
      onPrimary: Color(4280289086),
      primaryContainer: Color(4288710082),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294949299),
      onSecondary: Color(4281533445),
      secondaryContainer: Color(4291591028),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4292984316),
      onTertiary: Color(4280550971),
      tertiaryContainer: Color(4289037503),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279570968),
      onSurface: Color(4294965756),
      onSurfaceVariant: Color(4291872979),
      outline: Color(4289241259),
      outlineVariant: Color(4287070603),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293386472),
      inversePrimary: Color(4283710836),
      primaryFixed: Color(4293844223),
      onPrimaryFixed: Color(4279960121),
      primaryFixedDim: Color(4292328187),
      onPrimaryFixedVariant: Color(4282526560),
      secondaryFixed: Color(4294957782),
      onSecondaryFixed: Color(4281073922),
      secondaryFixedDim: Color(4294947757),
      onSecondaryFixedVariant: Color(4284359456),
      tertiaryFixed: Color(4294040319),
      onTertiaryFixed: Color(4280156470),
      tertiaryFixedDim: Color(4292721144),
      onTertiaryFixedVariant: Color(4282788190),
      surfaceDim: Color(4279570968),
      surfaceBright: Color(4282071102),
      surfaceContainerLowest: Color(4279242002),
      surfaceContainerLow: Color(4280097312),
      surfaceContainer: Color(4280360484),
      surfaceContainerHigh: Color(4281084207),
      surfaceContainerHighest: Color(4281807673),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294965756),
      surfaceTint: Color(4292328187),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4292656895),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965753),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4294949299),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965755),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4292984316),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279570968),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294965756),
      outline: Color(4291872979),
      outlineVariant: Color(4291872979),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293386472),
      inversePrimary: Color(4281671251),
      primaryFixed: Color(4294042111),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4292656895),
      onPrimaryFixedVariant: Color(4280289086),
      secondaryFixed: Color(4294959325),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4294949299),
      onSecondaryFixedVariant: Color(4281533445),
      tertiaryFixed: Color(4294238463),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4292984316),
      onTertiaryFixedVariant: Color(4280550971),
      surfaceDim: Color(4279570968),
      surfaceBright: Color(4282071102),
      surfaceContainerLowest: Color(4279242002),
      surfaceContainerLow: Color(4280097312),
      surfaceContainer: Color(4280360484),
      surfaceContainerHigh: Color(4281084207),
      surfaceContainerHighest: Color(4281807673),
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
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  // List<ExtendedColor> get extendedColors => [
  // ];
}
