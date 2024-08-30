import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ManagementBar extends StatelessWidget {
  const ManagementBar({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Container(
      color: theme.secondary,
      padding: const EdgeInsets.only(
          left: 10, right: 10, top: kTextTabBarHeight * 0.6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Management",
                style: theme.typography.headlineLarge,
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/register_employee');
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                        color: const Color(0xFF16C098),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: theme.secondary,
                        ),
                        Text(
                          "Add Employee",
                          style: theme.typography.labelMedium2,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(Icons.upload_sharp),
              Text(
                'Upload CSV',
                style: theme.typography.displaySmall,
              )
            ],
          )
        ],
      ),
    );
  }
}
