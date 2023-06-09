import 'package:flutter/material.dart';

import 'palette.dart';

class CustomTheme {
  static ThemeData dark(BuildContext context) {
    final theme = Theme.of(context);
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(
          Palette.red500.value,
          {
            100: Palette.red100,
            200: Palette.red200,
            300: Palette.red300,
            400: Palette.red400,
            500: Palette.red500,
            600: Palette.red600,
            700: Palette.red700,
            800: Palette.red800,
            900: Palette.red900,
          },
        ),
      ).copyWith(
        secondary: Palette.red500,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: Palette.almostBlack,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Palette.almostBlack,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: Colors.white,
        inactiveTrackColor: Colors.grey.shade900,
        thumbColor: Colors.white,
        valueIndicatorColor: Palette.red500,
        inactiveTickMarkColor: Colors.transparent,
        activeTickMarkColor: Colors.transparent,
      ),
      textTheme: theme.primaryTextTheme
          .copyWith(
            labelLarge: theme.primaryTextTheme.labelLarge?.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
          .apply(displayColor: Colors.white),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Palette.red500,
        ),
      ),
    );
  }
}
