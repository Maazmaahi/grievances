import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      path: RoutesName.signInScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const SignInScreen();
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

class RoutesName {
  static const splashScreen = "/splash";
  static const signInScreen = "/sign_in";
  static const registerScreen = "/register";
  static const homeScreen = "/home";
  static const otpScreen = "/otp";
  static const dashboardScreen = "/dashboard";
}
