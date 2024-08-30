import 'package:demoz_app/controllers/auth/auth_cubit.dart';
import 'package:demoz_app/core/app.dart';
import 'package:demoz_app/core/login_manager.dart';
import 'package:demoz_app/firebase_options.dart';
import 'package:demoz_app/services/authentication/auth_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  String? userId = await LoginManager.getUser();
  runApp(BlocProvider(
    create: (context) => AuthCubit(authServices: AuthServices()),
    child: App(userId: userId),
  ));
}
