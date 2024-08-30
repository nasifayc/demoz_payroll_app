import 'package:demoz_app/controllers/auth/auth_cubit.dart';
import 'package:demoz_app/controllers/auth/auth_state.dart';
import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:demoz_app/widgets/common/custome_form_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyRegistrationForm extends StatefulWidget {
  final String? email;
  final String? password;
  const CompanyRegistrationForm(
      {super.key, required this.email, required this.password});

  @override
  State<CompanyRegistrationForm> createState() =>
      _CompanyRegistrationFormState();
}

class _CompanyRegistrationFormState extends State<CompanyRegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _tinNumberController = TextEditingController();
  final TextEditingController _numberOfEmployeesController =
      TextEditingController();
  final TextEditingController _companyBankController = TextEditingController();
  final TextEditingController _bankAccountController = TextEditingController();

  @override
  void dispose() {
    _companyNameController.dispose();
    _addressController.dispose();
    _phoneNumberController.dispose();
    _tinNumberController.dispose();
    _numberOfEmployeesController.dispose();
    _companyBankController.dispose();
    _bankAccountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CustomFormComponents formComponents =
        CustomFormComponents(context: context);
    AppTheme theme = AppTheme.of(context);
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              formComponents.buildNormalTextField(
                  _companyNameController,
                  Text(
                    'Company name',
                    style: theme.typography.labelMedium,
                  ), validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Company name is required!';
                }

                return null;
              }),
              const SizedBox(
                height: 10,
              ),
              formComponents.buildNormalTextField(
                  _addressController,
                  Text(
                    'Address of the company',
                    style: theme.typography.labelMedium,
                  ), validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Address is required!';
                }

                return null;
              }),
              const SizedBox(
                height: 10,
              ),
              formComponents.buildNormalTextField(
                  _phoneNumberController,
                  Text(
                    'Phone Number',
                    style: theme.typography.labelMedium,
                  ), validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Phone Number is required!';
                }

                return null;
              }),
              const SizedBox(
                height: 10,
              ),
              formComponents.buildNormalTextField(
                  _tinNumberController,
                  Text(
                    'Tin Number',
                    style: theme.typography.labelMedium,
                  ), validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Tin Number is required!';
                }

                return null;
              }),
              const SizedBox(
                height: 10,
              ),
              formComponents.buildNormalTextField(
                  _numberOfEmployeesController,
                  Text(
                    'Number of employees',
                    style: theme.typography.labelMedium,
                  ), validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Number of employees is required!';
                }

                return null;
              }),
              const SizedBox(
                height: 10,
              ),
              formComponents.buildNormalTextField(
                  _companyBankController,
                  Text(
                    'Company bank ',
                    style: theme.typography.labelMedium,
                  ), validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Company bank  is required!';
                }

                return null;
              }),
              const SizedBox(
                height: 10,
              ),
              formComponents.buildNormalTextField(
                  _bankAccountController,
                  Text(
                    'Bank account number ',
                    style: theme.typography.labelMedium,
                  ), validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bank account number  is required!';
                }

                return null;
              }),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (widget.email == null || widget.password == null) {
                          context.read<AuthCubit>().signInWithGoogle(
                              _companyNameController.text.trim(),
                              _addressController.text.trim(),
                              _phoneNumberController.text.trim(),
                              _tinNumberController.text.trim(),
                              int.parse(
                                  _numberOfEmployeesController.text.trim()),
                              _companyBankController.text.trim(),
                              _bankAccountController.text.trim());
                        } else {
                          context.read<AuthCubit>().signUp(
                              widget.email!,
                              widget.password!,
                              _companyNameController.text.trim(),
                              _addressController.text.trim(),
                              _phoneNumberController.text.trim(),
                              _tinNumberController.text.trim(),
                              int.parse(
                                  _numberOfEmployeesController.text.trim()),
                              _companyBankController.text.trim(),
                              _bankAccountController.text.trim());
                        }
                      }
                    },
                    child: Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: theme.accent3,
                          borderRadius: BorderRadius.circular(13.7)),
                      child: state is Authenticating ||
                              state is AuthenticatingGoogle
                          ? Center(
                              child: CircularProgressIndicator(
                                color: theme.primary,
                              ),
                            )
                          : Center(
                              child: Text(
                              "Submit for approval",
                              style: theme.typography.labelMedium,
                            )),
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
