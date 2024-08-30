import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:demoz_app/widgets/layout/add_employee_description.dart';
import 'package:demoz_app/widgets/layout/employee_registration_form.dart';
import 'package:flutter/material.dart';

class RegisterEmployee extends StatelessWidget {
  const RegisterEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Add Employee',
            style: theme.typography.displayMedium,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [AddEmployeeDescription(), EmployeeRegistrationForm()],
          ),
        ),
      ),
    );
  }
}
