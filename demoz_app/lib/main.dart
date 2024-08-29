import 'package:demoz_app/core/app.dart';
import 'package:demoz_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // String? userId = await LoginManager.getUser();
  runApp(const App());
}
