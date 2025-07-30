import 'package:core/themes/theme_config.dart';
import 'package:flutter/material.dart';

ThemeData themeDataLight = ThemeData(
  useMaterial3: false,
).copyWith(
  primaryColor: primaryColor,
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    background: appLightBackground,
    onBackground: gray900,
    surface: neutralWhite,
    onSurface: gray900,
    outline: blueGray50,
    primary: blue700,
    onPrimary: neutralWhite,
    secondary: gray200,
    onSecondary: gray600,
    tertiary: gray200,
    onTertiary: gray600,
    error: red600,
    onError: neutralWhite,
    primaryContainer: green50,
    onPrimaryContainer: blue700,
    secondaryContainer: yellow50,
    onSecondaryContainer: yellow700,
    tertiaryContainer: blue50,
    onTertiaryContainer: blue700,
    errorContainer: red50,
    onErrorContainer: red700,
  ),
  cardColor: neutralWhite,
  scaffoldBackgroundColor: lightBackground,
  appBarTheme: AppBarTheme(
    backgroundColor: neutralWhite,
    elevation: 0,
    titleTextStyle: myTextThemeLight.headlineSmall,
    iconTheme: const IconThemeData(
      color: gray900,
    ),
  ),
  textTheme: myTextThemeLight,
);

ThemeData themeDataDark = ThemeData.dark(
  useMaterial3: false,
).copyWith(
  primaryColor: primaryColor,
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    background: lowEmphasis,
    onBackground: textHigh,
    surface: black,
    onSurface: textHigh,
    outline: mediumEmphasis,
    primary: blue700,
    onPrimary: neutralWhite,
    secondary: lowEmphasis,
    onSecondary: textMedium,
    tertiary: mediumEmphasis,
    onTertiary: gray600,
    error: red600,
    onError: neutralWhite,
    primaryContainer: lowEmphasis,
    onPrimaryContainer: green600,
    secondaryContainer: lowEmphasis,
    onSecondaryContainer: yellow700,
    tertiaryContainer: lowEmphasis,
    onTertiaryContainer: blue700,
    errorContainer: lowEmphasis,
    onErrorContainer: red500,
  ),
  cardColor: darkBackground,
  scaffoldBackgroundColor: darkBackground,
  appBarTheme: AppBarTheme(
    backgroundColor: darkBackground,
    elevation: 0,
    titleTextStyle: myTextThemeLight.headlineSmall?.copyWith(
      color: highEmphasis,
    ),
    iconTheme: const IconThemeData(
      color: highEmphasis,
    ),
  ),
  textTheme: myTextThemeDark,
);
