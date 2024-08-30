import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:demoz_app/widgets/onboarding/auth_box.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            "assets/images/logo.png",
            height: 185,
            width: 161,
          ),
          const SizedBox(
            height: 50,
          ),
          const AuthBox()
        ],
      ),
    );
  }
}
