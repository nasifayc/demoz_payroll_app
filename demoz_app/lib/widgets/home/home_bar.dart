import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomeBar extends StatelessWidget {
  const HomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);

    return Container(
      color: theme.secondary,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Home',
            style: theme.typography.headlineLarge,
          ),
          Image.asset(
            'assets/images/setting-2.png',
            height: 24,
            width: 24,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error);
            },
          )
        ],
      ),
    );
  }
}
