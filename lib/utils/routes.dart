import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grievances/screens/dashboard/dashboard_screen.dart';
import 'package:grievances/screens/home/home_screen.dart';
import 'package:grievances/screens/sign_in_screen/sign_in_screen.dart';
import 'package:grievances/screens/splash/splash_screen.dart';

GoRouter generateRoute() {
  return GoRouter(
    initialLocation: '/', // Starting screen
    routes: [
      // Define your app routes
      GoRoute(
        path: '/', // Splash screen route
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/signin', // Signin screen route
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/home', // Home screen route
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/dashboard', // Dashboard screen route
        builder: (context, state) => const DashboardScreen(),
      ),
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(child: Text('Page Not Found')),
    ),
  );
}
