import 'package:demoz_app/controllers/auth/auth_cubit.dart';
import 'package:demoz_app/controllers/auth/auth_state.dart';
import 'package:demoz_app/screens/landing_page.dart';
import 'package:demoz_app/widgets/authentication/signin/login_form.dart';
import 'package:demoz_app/widgets/authentication/signup/welcome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // AppTheme theme = AppTheme.of(context);
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const LandingPage(),
              ),
              (Route<dynamic> route) => false,
            );
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: SafeArea(
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
                  const LoginForm()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
