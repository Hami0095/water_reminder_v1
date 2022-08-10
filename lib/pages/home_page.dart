import 'package:flutter/material.dart';
import 'package:water_reminder_v1/screens/home_screen.dart';

import '../screens/settings_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home-page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [const HomeScreen(), const SettingsScreen()];
  int _selectedIndex = 0;
  void _onTap(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) => _onTap(value),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
              ),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_rounded,
              ),
              label: "settings",
            ),
          ],
        ),
      ),
    );
  }
}
