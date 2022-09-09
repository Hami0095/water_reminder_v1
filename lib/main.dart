import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:water_reminder_v1/Themes/themes.dart';
import 'package:water_reminder_v1/pages/home_page.dart';
import 'package:water_reminder_v1/pages/onboarding_page.dart';
import 'package:water_reminder_v1/screens/home_screen.dart';
import 'package:water_reminder_v1/screens/sleep_cycle_screen.dart';
import 'package:water_reminder_v1/screens/gender_screen.dart';
import 'package:water_reminder_v1/screens/weight_screen.dart';

import './screens/splash_screen.dart';

late int initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

//TODO I have to make check of the data:
//TODO 1. Lets break the code and create a separate file for the management of the firebase stuff
//TODO 2. Make a firebase Provider for the state management
//TODO 3. Start working on pushing the notifications then!

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: MyThemes.lightTheme,
        home: const SplashScreen(route: OnBoardingPage()),
        routes: {
          GenderScreen.routeName: (ctx) => const GenderScreen(),
          WeightScreen.routeName: (ctx) => const WeightScreen(),
          SleepCycleScreen.routName: (ctx) => const SleepCycleScreen(),
          HomePage.routeName: (ctx) => const HomePage(),
          OnBoardingPage.routeName: (ctx) => const OnBoardingPage(),
        });
  }
}
