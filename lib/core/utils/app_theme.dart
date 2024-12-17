import 'package:flutter/material.dart';
import 'app_colors.dart'; // Import the AppColors class

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    // Basic Theme Colors
    primaryColor: AppColors.primary,
    // Light background color
    scaffoldBackgroundColor: AppColors.backgroundLight,

    // Text Theme: Updated for Flutter's latest versions
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimary),
      // Body text (Large)
      bodyMedium: TextStyle(color: AppColors.textSecondary),
      // Body text (Medium)
      titleLarge: TextStyle(
          color: AppColors.primary,
          fontSize: 20), // AppBar or header title color (Black)
    ),

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary, // AppBar background color (Black)
      titleTextStyle: TextStyle(
        color: AppColors.secondary, // AppBar title color (White)
        fontSize: 20,
      ),
    ),

    // Button and ElevatedButton
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primary, // Button background color (Black)
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.secondary,
        backgroundColor: AppColors.primary, // Button text color (White)
      ),
    ),

    // Icon Theme
    iconTheme: const IconThemeData(
      color: AppColors.secondary, // Icon color (White)
    ),

    // Card and Divider Colors
    cardColor: AppColors.secondary,
    // Cards use white color
    dividerColor: AppColors.tertiary,
    // Divider color (Gray)

    // Other properties
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      // Used as accent color
      surface: AppColors.secondary,
      onSurface: AppColors.textPrimary,
      onSecondary: AppColors.textSecondary,
    ).copyWith(surface: AppColors.backgroundLight),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    // Basic Theme Colors
    primaryColor: AppColors.primary,
    // Dark background color
    scaffoldBackgroundColor: AppColors.backgroundDark,

    // Text Theme: Updated for Flutter's latest versions
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textSecondary),
      // Body text (Large)
      bodyMedium: TextStyle(color: AppColors.textSecondary),
      // Body text (Medium)
      titleLarge: TextStyle(
          color: AppColors.primary,
          fontSize: 20), // AppBar or header title color (Black)
    ),

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary, // AppBar background color (Black)
      titleTextStyle: TextStyle(
        color: AppColors.secondary, // AppBar title color (White)
        fontSize: 20,
      ),
    ),

    // Button and ElevatedButton
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primary, // Button background color (Black)
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.secondary,
        backgroundColor: AppColors.primary, // Button text color (White)
      ),
    ),

    // Icon Theme
    iconTheme: const IconThemeData(
      color: AppColors.secondary, // Icon color (White)
    ),

    // Card and Divider Colors
    cardColor: AppColors.tertiary,
    // Cards use gray color
    dividerColor: AppColors.tertiary,
    // Divider color (Gray)

    // Other properties
    visualDensity: VisualDensity.adaptivePlatformDensity, colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      // Used as accent color
      surface: AppColors.tertiary,
      onSurface: AppColors.textSecondary,
      onSecondary: AppColors.textPrimary,
    ).copyWith(surface: AppColors.backgroundDark),
  );

  // Default Theme (Optional, can be the light theme)
  static ThemeData defaultTheme = lightTheme;
}
