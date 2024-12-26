import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final bool hasAppBar;
  final String title;
  final List<Widget>? actions;

  const AppScaffold({
    super.key,
    this.hasAppBar = true,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hasAppBar ? AppBar(
        backgroundColor: Colors.black,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: actions,
        iconTheme: const IconThemeData(color: Colors.white),
      ): null,
    );
  }
}
