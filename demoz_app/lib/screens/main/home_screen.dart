import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:demoz_app/widgets/home/company_detail_status.dart';
import 'package:demoz_app/widgets/home/company_status_card.dart';
import 'package:demoz_app/widgets/home/home_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return const SafeArea(
      child: Stack(
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: 10, right: 10, top: kToolbarHeight * 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CompanyStatusCard(),
                Expanded(
                  child: CompanyDetailStatus(),
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: HomeBar(),
          )
        ],
      ),
    );
  }
}
