import 'package:demoz_app/controllers/auth/auth_cubit.dart';
import 'package:demoz_app/controllers/auth/auth_state.dart';
import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:demoz_app/screens/landing_page.dart';
import 'package:demoz_app/widgets/layout/company_registration_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyRegistrationScreen extends StatelessWidget {
  final String? email;
  final String? password;
  const CompanyRegistrationScreen(
      {super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushAndRemoveUntil(
              context,
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Register your company',
                  style: theme.typography.headlineLarge,
                ),
                Row(
                  children: [
                    Text(
                      'to',
                      style: theme.typography.headlineLarge,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      'Demoz Payroll',
                      style: theme.typography.headlineLarge2,
                    ),
                  ],
                ),
                Text(
                  "Register your company to continue",
                  style: theme.typography.titleMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                CompanyRegistrationForm(
                  email: email,
                  password: password,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
