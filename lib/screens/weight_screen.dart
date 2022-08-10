import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_reminder_v1/screens/sleep_cycle_screen.dart';

class WeightScreen extends StatelessWidget {
  static const routeName = "/weight-screen";
  const WeightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weightController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Center(child: Text("Weight")),
            TextFormField(
              controller: weightController,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text(
                  'Enter Your Weight',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                border: const OutlineInputBorder(),
              ),
              onFieldSubmitted: (_) {},
              onSaved: (value) {},
              validator: (v) {
                if (v!.isEmpty) {
                  return 'Please enter value';
                } else {
                  return null;
                }
              },
            ),
            TextButton(
              onPressed: () {
                if (weightController.text.isNotEmpty) {
                  // TODO add the weight to the database!
                  Navigator.of(context).pushNamed(SleepCycleScreen.routName);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Opps Sorry"),
                        content: const Text(
                            "Please Enter some weight before we continue"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Column(
                                children: const [
                                  Divider(),
                                  Text("OK"),
                                ],
                              ))
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}
