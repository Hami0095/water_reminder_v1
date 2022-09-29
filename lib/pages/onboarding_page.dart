// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_reminder_v1/screens/gender_screen.dart';
import 'package:water_reminder_v1/screens/sleep_cycle_screen.dart';
import 'package:water_reminder_v1/screens/weight_screen.dart';

import 'home_page.dart';

class OnBoardingPage extends StatelessWidget {
  static const routeName = '/onboardingpage';
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(
      initialPage: 1,
    );
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children: const [
            GenderScreen(),
            WeightScreen(),
            SleepCycleScreen(),
          ],
        ),
      ),
    );
  }
}
