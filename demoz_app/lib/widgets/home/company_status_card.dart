import 'package:demoz_app/controllers/auth/auth_cubit.dart';
import 'package:demoz_app/controllers/auth/auth_state.dart';
import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:demoz_app/widgets/common/static_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyStatusCard extends StatelessWidget {
  const CompanyStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 120,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: theme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: theme.primary, width: 1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Number of \nEmployees",
                            style: theme.typography.displayMedium,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            state.company.numberOfEmployees.toString(),
                            style: theme.typography.headlineLarge2,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 120,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color(0xFFA3D139).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: const Color(0xFFA3D139), width: 1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Income Tax \npaid ",
                            style: theme.typography.displayMedium,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('2000',
                              style: TextStyle(
                                color: Color(0xFFA3D139),
                                height: 1.5,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 120,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color(0xFF30BEB6).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: const Color(0xFF30BEB6), width: 1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pension Tax \nPaid",
                            style: theme.typography.displayMedium,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('4',
                              style: TextStyle(
                                color: Color(0xFF30BEB6),
                                height: 1.5,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 120,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color(0xFFFF7F74).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: const Color(0xFFFF7F74), width: 1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Employees \nPerformance",
                            style: theme.typography.displayMedium,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('95 %',
                              style: TextStyle(
                                color: Color(0xFFFF7F74),
                                height: 1.5,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        }
        return StaticUtils.getShimmerEffect(theme);
      },
    );
  }
}
