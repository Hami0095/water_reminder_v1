import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_reminder_v1/pages/home_page.dart';
import 'package:water_reminder_v1/screens/home_screen.dart';
import 'package:water_reminder_v1/screens/sleep_cycle_screen.dart';
import 'package:water_reminder_v1/screens/gender_screen.dart';
import 'package:water_reminder_v1/screens/weight_screen.dart';

import './screens/splash_screen.dart';

int initScreen = 0;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt(HomePage.routeName)!;
  await preferences.setInt(HomePage.routeName, 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: initScreen == 0
            ? const SplashScreen(route: GenderScreen())
            : const SplashScreen(route: HomePage()),
        routes: {
          GenderScreen.routeName: (ctx) => const GenderScreen(),
          WeightScreen.routeName: (ctx) => const WeightScreen(),
          SleepCycleScreen.routName: (ctx) => const SleepCycleScreen(),
          HomePage.routeName: (ctx) => const HomePage(),
        });
  }
}
