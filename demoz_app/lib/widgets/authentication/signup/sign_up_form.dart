import 'package:demoz_app/controllers/auth/auth_cubit.dart';
import 'package:demoz_app/controllers/auth/auth_state.dart';
import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:demoz_app/screens/layouts/company_registration_screen.dart';
import 'package:demoz_app/widgets/common/custome_form_components.dart';
import 'package:demoz_app/widgets/common/primary_button.dart';
import 'package:demoz_app/widgets/common/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    CustomFormComponents formComponents =
        CustomFormComponents(context: context);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          formComponents.buildNormalTextField(
            _emailController,
            Text(
              'Email Address',
              style: theme.typography.labelMedium,
            ),
            validator: (value) {
              final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
              if (value == null || value.isEmpty) {
                return 'Email is required!';
              }

              // Validate email format
              if (!emailRegex.hasMatch(_emailController.text.trim())) {
                return 'Invalid email format.';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          formComponents.buildPasswordField(
            _passwordController,
            Text(
              'Password',
              style: theme.typography.labelMedium,
            ),
            validator: (value) {
              final passwordRegex =
                  RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
              if (value == null || value.isEmpty) {
                return 'Password is required!';
              }

              if (!passwordRegex.hasMatch(_passwordController.text.trim())) {
                return 'Password must be at least 8 characters long and contain both letters and numbers.';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return PrimaryButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CompanyRegistrationScreen(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim()),
                      ));
                    }
                  },
                  child: state is Authenticating
                      ? CircularProgressIndicator(
                          color: theme.primary,
                        )
                      : Text(
                          "Sign Up",
                          style: theme.typography.labelMedium2,
                        ));
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Or continue with social account",
              style: theme.typography.titleMedium,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return SecondaryButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CompanyRegistrationScreen(
                        email: null, password: null),
                  ));
                },
                prefix: Image.asset(
                  'assets/images/google.png',
                  height: 25,
                  width: 25,
                ),
                child: state is AuthenticatingGoogle
                    ? CircularProgressIndicator(
                        color: theme.secondary,
                      )
                    : Text(
                        "Google",
                        style: theme.typography.labelMedium,
                      ),
              );
            },
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Did you already have an account?",
                style: theme.typography.labelMedium,
              ),
              const SizedBox(
                width: 3,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text(
                  "Login",
                  style: theme.typography.headlineMedium2,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
