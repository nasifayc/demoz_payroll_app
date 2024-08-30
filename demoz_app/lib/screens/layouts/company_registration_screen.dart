import 'package:flutter/material.dart';

class CompanyRegistrationScreen extends StatefulWidget {
  final String? email;
  final String? password;
  const CompanyRegistrationScreen(
      {super.key, required this.email, required this.password});

  @override
  State<CompanyRegistrationScreen> createState() =>
      _CompanyRegistrationScreenState();
}

class _CompanyRegistrationScreenState extends State<CompanyRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
