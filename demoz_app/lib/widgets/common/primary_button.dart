import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;

  const PrimaryButton(
      {super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: theme.primary, borderRadius: BorderRadius.circular(13.7)),
        child: Center(child: child),
      ),
    );
  }
}
