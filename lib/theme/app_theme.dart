import 'package:flutter/material.dart';
import 'package:grievances/theme/app_colors.dart';

// Light Theme
final ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.black, // Use black for primary color
  scaffoldBackgroundColor: AppColors.white, // Use white for background
  colorScheme: const ColorScheme.light(
    primary: AppColors.black,
    secondary: AppColors.gray, // Accent color using gray
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.black), // Text color set to black
    bodyMedium: TextStyle(color: AppColors.black), // Text color set to black
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.black, // AppBar background set to black
    titleTextStyle: TextStyle(color: AppColors.white), // Title text set to white
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.black, // Button color set to black
    textTheme: ButtonTextTheme.primary,
  ),
);

// Dark Theme
final ThemeData darkTheme = ThemeData(
  primaryColor: AppColors.black,
  scaffoldBackgroundColor: AppColors.black,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.black,
    secondary: AppColors.gray, // Accent color using gray
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.white), // Text color set to white
    bodyMedium: TextStyle(color: AppColors.white), // Text color set to white
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.black, // AppBar background set to black
    titleTextStyle: TextStyle(color: AppColors.white), // Title text set to white
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.gray, // Button color set to gray
    textTheme: ButtonTextTheme.primary,
  ),
);
