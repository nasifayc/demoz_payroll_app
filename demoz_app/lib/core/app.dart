import 'package:demoz_app/controllers/auth/auth_cubit.dart';
import 'package:demoz_app/core/app_navigator.dart';
import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:demoz_app/models/company_model.dart';
import 'package:demoz_app/screens/layouts/login_screen.dart';
import 'package:demoz_app/screens/layouts/sign_up_screen.dart';
import 'package:demoz_app/services/authentication/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  final String? userId;
  const App({super.key, required this.userId});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    _initilize();
    super.initState();
  }

  void _initilize() async {
    if (widget.userId != null) {
      try {
        final AuthServices auth = AuthServices();
        CompanyModel? company = await auth.getUser(widget.userId!);
        _emitAuthenticated(company!);
      } catch (e) {
        _emitUnAuthenticated(e.toString());
      }
    }
  }

  void _emitAuthenticated(CompanyModel company) {
    context.read<AuthCubit>().emitAuthenticated(company);
  }

  void _emitUnAuthenticated(String e) {
    context.read<AuthCubit>().emitUnauthenticated(e);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // debugShowCheckedModeBanner: false,
        title: 'Demoz',
        routes: {
          '/sign_up': (context) => const SignUpScreen(),
          '/login': (context) => const LoginScreen()
        },
        theme: LightModeTheme().themeData,
        home: const AppNavigator());
  }
}
