import 'package:demoz_app/controllers/auth/auth_cubit.dart';
import 'package:demoz_app/controllers/auth/auth_state.dart';
import 'package:demoz_app/screens/landing_page.dart';
import 'package:demoz_app/widgets/authentication/signup/sign_up_form.dart';
import 'package:demoz_app/widgets/authentication/signup/welcome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    // AppTheme theme = AppTheme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/logo2.png',
                  height: 73,
                  width: 69,
                ),
                const SizedBox(
                  height: 10,
                ),
                const WelcomeCard(),
                const SizedBox(
                  height: 30,
                ),
                const SignUpForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
