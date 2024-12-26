import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grievances/core/routes/routes_name.dart';
import 'package:grievances/presentation/screens/exports.dart';


final GoRouter router = GoRouter(
  initialLocation: RoutesName.splashScreen,
  routes: [
    // Splash Screen Route
    GoRoute(
      path: RoutesName.splashScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),

    // SignIn Screen Route
    GoRoute(
      path: RoutesName.loginScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),

    // Register Screen Route
    GoRoute(
      path: RoutesName.registerScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      },
    ),

    // Home Screen Route
    GoRoute(
      path: RoutesName.homeScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),

    // Home Screen Route
    GoRoute(
      path: RoutesName.otpScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const OtpScreen();
      },
    ),

    // Dashboard Screen Route
    GoRoute(
      path: RoutesName.dashboardScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const DashboardScreen();
      },
    ),
  ],
);