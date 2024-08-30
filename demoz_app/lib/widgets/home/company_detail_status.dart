import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:demoz_app/widgets/home/upcoming_detail.dart';
import 'package:flutter/material.dart';

class CompanyDetailStatus extends StatefulWidget {
  const CompanyDetailStatus({super.key});

  @override
  State<CompanyDetailStatus> createState() => _CompanyDetailStatusState();
}

class _CompanyDetailStatusState extends State<CompanyDetailStatus>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: const [
            Tab(text: 'Upcoming'),
            Tab(text: 'Past'),
          ],
          labelColor: theme.secondaryText,
          unselectedLabelColor: theme.accent2,
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: theme.primary,
                width: 2.0,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [UpcomingDetail(), UpcomingDetail()],
          ),
        ),
      ],
    );
  }
}
