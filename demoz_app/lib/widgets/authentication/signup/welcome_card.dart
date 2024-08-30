import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome 👋",
          style: theme.typography.headlineLarge,
        ),
        Row(
          children: [
            Text(
              "To",
              style: theme.typography.headlineLarge,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Demoz Payroll",
              style: theme.typography.headlineLarge2,
            ),
          ],
        ),
        Text(
          'Hello there, Sign up to continue',
          style: theme.typography.titleMedium,
        )
      ],
    );
  }
}
