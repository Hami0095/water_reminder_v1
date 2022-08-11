import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_reminder_v1/screens/sleep_cycle_screen.dart';

import '../model/data.dart';

class WeightScreen extends StatefulWidget {
  static const routeName = "/weight-screen";
  const WeightScreen({Key? key}) : super(key: key);

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  final databaseReference = FirebaseFirestore.instance;
  Data data = Data(
    uid: "user1",
    gender: "",
    bedTime: "",
    wakeTime: "",
    weight: "",
  );

  bool isInit = false;
  @override
  void didChangeDependencies() {
    if (isInit == false) {
      data = ModalRoute.of(context)!.settings.arguments as Data;
      isInit = true;
      print(data);
    }
    super.didChangeDependencies();
  }

  void updateRecord() async {
    await databaseReference.collection("data").doc(data.uid).set({
      'gender': data.gender,
      'bedTime': data.bedTime,
      'wakeTime': data.wakeTime,
      'weight': data.weight,
    });
  }

  @override
  Widget build(BuildContext context) {
    final weightController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Container(
            height: 1000,
            child: Column(
              children: [
                const SizedBox(
                  height: 140,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  height: 90,
                  child: Card(
                    color: const Color.fromARGB(255, 153, 202, 241),
                    elevation: 2.0,
                    child: Center(
                      child: Text(
                        "Weight",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                const Divider(
                  endIndent: 150,
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 135, 194, 242),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: TextFormField(
                    controller: weightController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter Your Weight in kg',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                      border: OutlineInputBorder(),
                      disabledBorder: OutlineInputBorder(),
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
                ),
                const Divider(
                  endIndent: 10,
                ),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        if (states.contains(MaterialState.pressed)) {
                          return const Color.fromARGB(255, 0, 50, 91);
                        }
                        return const Color.fromARGB(255, 188, 219, 245);
                      },
                    ),
                  ),
                  onPressed: () {
                    if (weightController.text.isNotEmpty) {
                      data.weight = weightController.text;
                      updateRecord();
                      Navigator.of(context).pushNamed(
                        SleepCycleScreen.routName,
                        arguments: data,
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              "Opps Sorry",
                            ),
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
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  // style:
                  child: Container(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Continue",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
