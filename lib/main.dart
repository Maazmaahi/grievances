import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'theme/app_theme.dart'; // Import the app_theme.dart file
import 'utils/routes.dart'; // Import the routes setup

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Generate the GoRouter instance here and pass it to MaterialApp.router
  final GoRouter _router = generateRoute();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Grievance Management System',
      debugShowCheckedModeBanner: false,
      theme: lightTheme, // Light theme
      darkTheme: darkTheme, // Dark theme
      themeMode: ThemeMode.light, // Default light theme
      routerConfig: _router, // Pass the GoRouter configuration here
    );
  }
}
