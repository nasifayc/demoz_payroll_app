import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Center(
      child: Text(
        'Profile',
        style: theme.typography.headlineLarge,
      ),
    );
  }
}
