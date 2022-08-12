// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Text("This is onboarding page"),
      ),
    );
  }
}
