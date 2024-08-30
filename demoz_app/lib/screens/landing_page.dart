import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:demoz_app/screens/main/home_screen.dart';
import 'package:demoz_app/screens/main/management_screen.dart';
import 'package:demoz_app/screens/main/profile_screen.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    ManagementScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined), label: 'Management'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: theme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
