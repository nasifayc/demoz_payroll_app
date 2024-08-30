import 'dart:developer';

import 'package:demoz_app/controllers/auth/auth_cubit.dart';
import 'package:demoz_app/controllers/auth/auth_state.dart';
import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:demoz_app/models/employee_model.dart';
import 'package:demoz_app/widgets/common/custome_form_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeRegistrationForm extends StatefulWidget {
  const EmployeeRegistrationForm({super.key});

  @override
  State<EmployeeRegistrationForm> createState() =>
      _EmployeeRegistrationFormState();
}

class _EmployeeRegistrationFormState extends State<EmployeeRegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _tinNumberController = TextEditingController();
  final TextEditingController _grossSalaryController = TextEditingController();
  final TextEditingController _taxableEarningsController =
      TextEditingController();
  final TextEditingController _startingDateOfSalaryController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _tinNumberController.dispose();
    _grossSalaryController.dispose();
    _taxableEarningsController.dispose();
    _startingDateOfSalaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CustomFormComponents formComponents =
        CustomFormComponents(context: context);
    AppTheme theme = AppTheme.of(context);
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            formComponents.buildNormalTextField(
                _nameController,
                Text(
                  'Employee name',
                  style: theme.typography.labelSmall,
                ), validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Employee name is required!';
              }

              return null;
            }),
            const SizedBox(
              height: 10,
            ),
            formComponents.buildNormalTextField(
                _emailController,
                Text(
                  'Email address',
                  style: theme.typography.labelSmall,
                ), validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email address is required!';
              }

              return null;
            }),
            const SizedBox(
              height: 10,
            ),
            formComponents.buildNormalTextField(
                _phoneNumberController,
                Text(
                  'Phone number',
                  style: theme.typography.labelSmall,
                ), validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Phone number is required!';
              }

              return null;
            }),
            const SizedBox(
              height: 10,
            ),
            formComponents.buildNormalTextField(
                _tinNumberController,
                Text(
                  'Tin number',
                  style: theme.typography.labelSmall,
                ), validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Tin number is required!';
              }

              return null;
            }),
            const SizedBox(
              height: 10,
            ),
            formComponents.buildNormalTextField(
                _grossSalaryController,
                Text(
                  'Gross salary',
                  style: theme.typography.labelSmall,
                ), validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Gross salary is required!';
              }

              return null;
            }),
            const SizedBox(
              height: 10,
            ),
            formComponents.buildNormalTextField(
                _taxableEarningsController,
                Text(
                  'Taxable earnings',
                  style: theme.typography.labelSmall,
                ), validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Taxable earnings is required!';
              }

              return null;
            }),
            const SizedBox(
              height: 10,
            ),
            formComponents.buildNormalTextField(
                _startingDateOfSalaryController,
                Text(
                  'Starting date of salary',
                  style: theme.typography.labelSmall,
                ), validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Starting date of salary is required!';
              }

              return null;
            }),
            const SizedBox(
              height: 25,
            ),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      try {
                        EmployeeModel newEmployee = EmployeeModel(
                            name: _nameController.text.trim(),
                            email: _emailController.text.trim(),
                            phoneNumber: _phoneNumberController.text.trim(),
                            tinNumber: _tinNumberController.text.trim(),
                            grossSalary:
                                int.parse(_grossSalaryController.text.trim()),
                            taxableEarnings: int.parse(
                                _taxableEarningsController.text.trim()),
                            startingDateOfSalary:
                                _startingDateOfSalaryController.text.trim());
                        if (state is Authenticated) {
                          state.company.employees.add(newEmployee);
                          context.read<AuthCubit>().updateUser(state.company);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Employee Added!")));
                          Navigator.pop(context);
                        }
                      } catch (e) {
                        log(e.toString());
                      }
                    }
                  },
                  child: Container(
                    height: 60.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: theme.accent3,
                        borderRadius: BorderRadius.circular(13.7)),
                    child: state is Authenticating
                        ? Center(
                            child: CircularProgressIndicator(
                              color: theme.primary,
                            ),
                          )
                        : Center(
                            child: Text(
                            "Add employee",
                            style: theme.typography.labelMedium,
                          )),
                  ),
                );
              },
            )
          ],
        ));
  }
}
