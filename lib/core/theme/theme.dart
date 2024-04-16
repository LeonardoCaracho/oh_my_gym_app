import 'package:flutter/material.dart';

final themeData = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary, // Use your primary color as the seed
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    background: AppColors.background,
    surface: AppColors.background, // Surface usually matches background
    onPrimary: AppColors.textColor, // Text color on primary background
    onSecondary: AppColors.textColor, // Text color on secondary background
    onBackground: AppColors.textColor, // Text color on background
  ),
  appBarTheme: const AppBarTheme(
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 12, color: Colors.white),
  ),
  iconTheme: IconThemeData(
    color: AppColors.secondary,
  ),
  navigationBarTheme: NavigationBarThemeData(
    indicatorColor: AppColors.primary,
    backgroundColor: Colors.black,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    labelTextStyle: MaterialStateProperty.resolveWith((state) {
      if (state.contains(MaterialState.selected)) {
        return TextStyle(color: AppColors.primary);
      }
    }),
  ),
);

class AppColors {
  static Color get primary => const Color(0xFFF15E4D);
  static Color get secondary => Colors.white;
  static Color get background => const Color.fromARGB(255, 14, 14, 14);
  static Color get textColor => Colors.white;
  static Color get warning => Colors.red;
}

class AppSpacing {
  static const double sm = 4;
  static const double md = 8;
  static const double lg = 16;
}
