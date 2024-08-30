import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AddEmployeeDescription extends StatelessWidget {
  const AddEmployeeDescription({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Add New ",
              style: theme.typography.headlineLarge,
            ),
            Text(
              "Employee",
              style: theme.typography.headlineLarge2,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Here you add your new employee and start calculating his tax and salary",
          maxLines: 10,
          style: theme.typography.titleSmall,
        )
      ],
    );
  }
}
