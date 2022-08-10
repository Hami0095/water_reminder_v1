import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:water_reminder_v1/screens/weight_screen.dart';

class GenderScreen extends StatefulWidget {
  static const routeName = "/gender-screen";
  const GenderScreen({Key? key}) : super(key: key);

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: const Center(
                child: Text("Choose your Gender"),
              ),
            ),
            Row(
              children: [
                RoundCheckBox(
                  onTap: (selected) {},
                  uncheckedWidget: const Icon(Icons.circle, size: 15),
                  size: 25,
                ),
                const Text("Male", style: TextStyle(color: Colors.black))
              ],
            ),
            Row(
              children: [
                RoundCheckBox(
                  onTap: (selected) {},
                  uncheckedWidget: const Icon(Icons.circle, size: 15),
                  size: 25,
                ),
                const Text("Female")
              ],
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  //TODO add the gender to the database
                  Navigator.of(context).pushNamed(WeightScreen.routeName);
                });
              },
              child: const Text("Continue"),
            ),
          ],
        ),
      ),
    ));
  }
}
