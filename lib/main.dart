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
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setInt(HomePage.routeName, 1);
  initScreen = await preferences.getInt(GenderScreen.routeName) ?? 0;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: MyThemes.lightTheme,
        home: initScreen == 0 || initScreen == null
            ? const SplashScreen(route: MyOnBoardingPage())
            : const SplashScreen(route: HomePage()),
        routes: {
          GenderScreen.routeName: (ctx) => const GenderScreen(),
          WeightScreen.routeName: (ctx) => const WeightScreen(),
          SleepCycleScreen.routName: (ctx) => const SleepCycleScreen(),
          HomePage.routeName: (ctx) => const HomePage(),
        });
  }
}
