import 'package:flutter/material.dart';
import 'custom_appbar.dart';

class CustomScaffold extends StatelessWidget {
  final String appBarTitle;
  final Widget body;
  final List<Widget>? actions;
  final bool centerTitle;

  const CustomScaffold({
    super.key,
    required this.appBarTitle,
    required this.body,
    this.actions,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: appBarTitle,
        centerTitle: centerTitle,
        actions: actions,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: body,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
