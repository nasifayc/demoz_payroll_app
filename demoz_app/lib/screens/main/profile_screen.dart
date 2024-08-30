import 'package:demoz_app/controllers/auth/auth_cubit.dart';
import 'package:demoz_app/controllers/auth/auth_state.dart';
import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:demoz_app/models/company_model.dart';
import 'package:demoz_app/widgets/profile/profile_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _tinNumberController = TextEditingController();
  final TextEditingController _numberOfEmployeesController =
      TextEditingController();
  final TextEditingController _companyBankController = TextEditingController();
  final TextEditingController _bankAccountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);

    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: kTextTabBarHeight * 2),
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is Authenticated) {
                    CompanyModel company = state.company;

                    _emailController.text = company.email;
                    _phoneNumberController.text = company.phoneNumber;
                    _addressController.text = company.address;
                    _tinNumberController.text = company.tinNumber;
                    _numberOfEmployeesController.text =
                        company.numberOfEmployees.toString();
                    _companyBankController.text = company.companyBank;
                    _bankAccountController.text = company.bankAccountNumber;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                              color: theme.info,
                              borderRadius: BorderRadius.circular(75),
                              image: DecorationImage(
                                image: company.photo == null
                                    ? const AssetImage(
                                        "assets/images/profile.png")
                                    : NetworkImage(company.photo!)
                                        as ImageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Text(
                            "Company Name",
                            style: theme.typography.headlineMedium,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Text(
                            company.companyName,
                            style: theme.typography.titleMedium,
                          ),
                        ),
                        const SizedBox(height: 20),
                        buildProfileField(
                            label: "Company Email",
                            prefix: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Image.asset(
                                "assets/images/mail-01.png",
                                height: 24,
                                width: 24,
                              ),
                            ),
                            controller: _emailController,
                            theme: theme),
                        const SizedBox(height: 20),
                        buildProfileField(
                            label: "Phone Number",
                            prefix: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Image.asset(
                                "assets/images/call.png",
                                height: 24,
                                width: 24,
                              ),
                            ),
                            controller: _phoneNumberController,
                            theme: theme),
                        const SizedBox(height: 20),
                        buildProfileField(
                            label: "Company Address",
                            controller: _addressController,
                            theme: theme),
                        const SizedBox(height: 20),
                        buildProfileField(
                            label: "Number of Employees",
                            controller: _numberOfEmployeesController,
                            theme: theme),
                        const SizedBox(height: 20),
                        buildProfileField(
                            label: "Company Bank",
                            controller: _companyBankController,
                            theme: theme),
                        const SizedBox(height: 20),
                        buildProfileField(
                            label: "Company Account Number",
                            controller: _bankAccountController,
                            theme: theme),
                        const SizedBox(height: 100),
                      ],
                    );
                  }
                  return Text(
                    "Login First",
                    style: theme.typography.headlineLarge,
                  );
                },
              ),
            ),
          ),
          const Positioned(left: 0, right: 0, top: 0, child: ProfileBar()),
        ],
      ),
    );
  }

  Widget buildProfileField({
    Widget? prefix,
    required String label,
    required TextEditingController controller,
    required AppTheme theme,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.typography.headlineSmall,
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            prefix: prefix,
            filled: false,
            fillColor: theme.inputFieldBackground,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
      ],
    );
  }
}
