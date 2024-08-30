import 'package:demoz_app/controllers/auth/auth_cubit.dart';
import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:demoz_app/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({super.key});

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
            "Company \nProfile",
            style: theme.typography.headlineLarge,
          ),
          GestureDetector(
            onTap: () {
              context.read<AuthCubit>().signOut();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const OnboardingScreen(),
                ),
                (Route<dynamic> route) => false,
              );
            },
            child: Text(
              "Log Out",
              style: TextStyle(
                  color: theme.error,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
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
