import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Scaffold(
      body: Container(
        color: theme.secondary,
        child: Center(
          child: Image.asset(
            "assets/images/megaphone.png",
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}
