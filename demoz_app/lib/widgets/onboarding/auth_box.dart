import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AuthBox extends StatelessWidget {
  const AuthBox({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Container(
      decoration: BoxDecoration(
          color: theme.secondary,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      height: MediaQuery.of(context).size.height * 0.45,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                "Easy way to pay your tax ontime",
                style: theme.typography.headlineLarge,
              ),
            ),
            Text(
              "It is a long established fact that paying tax and other payments will be tedious process to keep up.",
              maxLines: 10,
              style: theme.typography.titleSmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: theme.accent3,
                        borderRadius: BorderRadius.circular(10)),
                    height: 56,
                    width: 135,
                    child: Center(
                      child: Text(
                        'Login',
                        style: theme.typography.labelMedium,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/sign_up');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: theme.accent3,
                        borderRadius: BorderRadius.circular(10)),
                    height: 56,
                    width: 135,
                    child: Center(
                      child: Text(
                        'Sign up',
                        style: theme.typography.labelMedium,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
