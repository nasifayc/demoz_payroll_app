import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Widget child;
  final Widget prefix;
  final void Function()? onPressed;

  const SecondaryButton(
      {super.key,
      required this.child,
      required this.onPressed,
      required this.prefix});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60.0,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: theme.accent2.withOpacity(0.3)),
            color: Colors.white,
            borderRadius: BorderRadius.circular(13.7)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefix,
            const SizedBox(
              width: 10,
            ),
            Center(child: child),
          ],
        ),
      ),
    );
  }
}
