import 'package:adabank/components/home_screen_components.dart';
import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  final Widget child;

  const BaseLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [child, reusableBottomScreenNav(context, child)]),
    );
  }
}
