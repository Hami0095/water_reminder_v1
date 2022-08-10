import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class SleepCycleScreen extends StatelessWidget {
  static const routName = "/bedtime-screen";
  const SleepCycleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Center(child: Text("Sleep Cycle")),
            const Text(
              "Wake Time",
            ),
            TextFormField(),
            const Text("Bed Time"),
            TextFormField(),
            Container(
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(HomePage.routeName);
                  },
                  child: const Text("Continue"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
