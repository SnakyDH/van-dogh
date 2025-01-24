import "package:flutter/material.dart";
import "package:van_dog/config/theme/app_font_theme.dart";

class AppColorConstants {
  static const Color primaryColor = Color(0xfffddd18);
  static const Color onPrimary = Color(0xff706100);
  static const Color secondary = Color(0xffa9c7ff);
  static const Color onSecondary = Color(0xff003153);
  static const Color error = Color(0xffffb4a4);
  static const Color onError = Color(0xffAD1C42);
  static const Color surface = Color(0xff27273A);
  static const Color onSurface = Color(0xffFEF9E2);
}

ThemeData appTheme = ThemeData(
  textTheme: appFontTheme,
  colorScheme: appLightColorTheme,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
  ),
);

ThemeData appDarkTheme = ThemeData(
  textTheme: appFontTheme,
  colorScheme: appDarkColorTheme,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
  ),
);

ColorScheme appLightColorTheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColorConstants.onPrimary,
  onPrimary: AppColorConstants.primaryColor,
  secondary: AppColorConstants.onSecondary,
  onSecondary: AppColorConstants.secondary,
  error: AppColorConstants.onError,
  onError: AppColorConstants.error,
  surface: AppColorConstants.onSurface,
  onSurface: AppColorConstants.surface,
);

ColorScheme appDarkColorTheme = ColorScheme(
  brightness: Brightness.dark,
  primary: AppColorConstants.primaryColor,
  onPrimary: AppColorConstants.onPrimary,
  secondary: AppColorConstants.secondary,
  onSecondary: AppColorConstants.onSecondary,
  error: AppColorConstants.error,
  onError: AppColorConstants.onError,
  surface: AppColorConstants.surface,
  onSurface: AppColorConstants.onSurface,
);
