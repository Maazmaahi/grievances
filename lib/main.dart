import 'package:flutter/material.dart';
import 'package:grievances/core/utils/app_theme.dart';
import 'package:grievances/core/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Grievance Management System',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router, // Use the GoRouter for navigation
    );
  }
}
