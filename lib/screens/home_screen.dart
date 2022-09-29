import 'package:flutter/material.dart';

import '../model/user_data.dart';

class HomeScreen extends StatelessWidget {
  final double intake;
  const HomeScreen({
    Key? key,
    required this.intake,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Text("this is home!"),
            Text("Water Intake: $intake ml"),
          ],
        ),
      ),
    );
  }
}
