import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:grievances/core/colors/app_colors.dart";
import "package:grievances/core/routes/routes_name.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        context.go(RoutesName.loginScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Grievances System",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Image.asset(
              "lib/assets/png/splash.png",
              width: 70,
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
