import 'package:flutter/material.dart';

class AppColors {
  // Primary color: Black
  static const Color primary = Color(0xFF000000);  // Black

  // Secondary color: White
  static const Color secondary = Color(0xFFFFFFFF);  // White

  // Tertiary color: Gray
  static const Color tertiary = Color(0xFF808080);  // Gray

  // Background colors for Light and Dark modes
  static const Color backgroundLight = Color(0xFFF5F5F5);  // Light background color
  static const Color backgroundDark = Color(0xFF121212);  // Dark background color

  // Text colors
  static const Color textPrimary = Color(0xFF212121);  // Dark text (for primary text)
  static const Color textSecondary = Color(0xFF757575);  // Light text (for secondary text)

  // Success, Error, Warning colors
  static const Color success = Color(0xFF4CAF50);  // Green (success)
  static const Color error = Color(0xFFF44336);  // Red (error)
  static const Color warning = Color(0xFFFFEB3B);  // Yellow (warning)

  // Additional colors
  static const Color info = Color(0xFF2196F3);  // Blue (info)
  static const Color divider = Color(0xFFBDBDBD);  // Divider color (gray)

  // Optional: Color for image uploads (when using image picker)
  static const Color imageUploadBorder = Color(0xFF9E9E9E);
}
