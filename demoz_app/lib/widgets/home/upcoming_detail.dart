import 'package:demoz_app/controllers/auth/auth_cubit.dart';
import 'package:demoz_app/controllers/auth/auth_state.dart';
import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:demoz_app/widgets/home/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingDetail extends StatelessWidget {
  const UpcomingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Container(
      color: theme.accent3,
      child: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: theme.secondary,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date',
                            style: theme.typography.displaySmall,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Aug 28, 2024 - Sep 5, 2024',
                            style: theme.typography.displayMedium,
                          )
                        ],
                      ),
                      Container(
                        height: 28,
                        width: 68,
                        decoration: BoxDecoration(
                            color: const Color(0xFFFF7F74).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Text(
                            'pay now',
                            style: TextStyle(color: Color(0xFFFF7F74)),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: theme.accent3,
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Income Tax",
                            style: theme.typography.displaySmall,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "4000 etb",
                            style: theme.typography.displayMedium,
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pension Tax",
                            style: theme.typography.displaySmall,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "5000 etb",
                            style: theme.typography.displayMedium,
                          )
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "August",
                            style: TextStyle(
                                color: Color(0xFFFF7F74),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Task on Due",
                            style: TextStyle(
                                color: Color(0xFFFF7F74),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: theme.secondary),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Employee Composition',
                          style: theme.typography.displaySmall,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Center(
                          child: SizedBox(
                              height: 100,
                              width: 100,
                              child: Chart(maleCount: 15, femaleCount: 5)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            if (state is Authenticated) {
                              return Center(
                                child: Text(
                                  '${state.company.numberOfEmployees} employee total',
                                  style: theme.typography.titleSmall,
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                    height: 200,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: theme.secondary),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Tax summery',
                          style: theme.typography.displaySmall,
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        Text(
                          "9,349.85 etb",
                          style: theme.typography.displayMedium,
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        const Text("49.98%",
                            style: TextStyle(color: Color(0xFF25D036)))
                      ],
                    )),
              )
            ],
          )
        ],
      )),
    );
  }
}
