import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.secondary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            "assets/images/logo.png",
            height: 185,
            width: 161,
          )),
          AuthBox()
        ],
      ),
    );
  }
}
