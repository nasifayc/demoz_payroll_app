import 'package:demoz_app/controllers/auth/auth_cubit.dart';
import 'package:demoz_app/controllers/auth/auth_state.dart';
// import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:demoz_app/widgets/managemnet/employees_table.dart';
import 'package:demoz_app/widgets/managemnet/management_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManagementScreen extends StatelessWidget {
  const ManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // AppTheme theme = AppTheme.of(context);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 10.0, vertical: kToolbarHeight * 2),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return EmployeesTable(
                  userId: state.company.id,
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
        const Positioned(left: 0, right: 0, top: 0, child: ManagementBar())
      ],
    );
  }
}
