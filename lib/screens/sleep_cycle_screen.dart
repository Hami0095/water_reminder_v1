import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

import '../model/data.dart';
import '../pages/home_page.dart';

class SleepCycleScreen extends StatefulWidget {
  static const routName = "/bedtime-screen";
  const SleepCycleScreen({Key? key}) : super(key: key);

  @override
  State<SleepCycleScreen> createState() => _SleepCycleScreenState();
}

class _SleepCycleScreenState extends State<SleepCycleScreen> {
  final timeFormat = DateFormat("h:mm a");

  late TimeOfDay time;
  final _wakeTimeController = TextEditingController();
  final _bedTimeController = TextEditingController();

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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                height: 80,
                child: Card(
                  color: const Color.fromARGB(255, 153, 202, 241),
                  elevation: 1.5,
                  child: Center(
                    child: Text(
                      "Sleep Cycle",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(endIndent: 290),
                  Text(
                    "Wake Time",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Divider(endIndent: 250),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 229, 243, 248),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: DateTimeField(
                        controller: _wakeTimeController,
                        format: timeFormat,
                        onShowPicker: (context, currentValue) async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(
                                currentValue ?? DateTime.now()),
                          );
                          return DateTimeField.convert(time);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(endIndent: 280),
                  Text(
                    "Bed Time",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Divider(endIndent: 210),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 229, 243, 248),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: DateTimeField(
                        controller: _bedTimeController,
                        format: timeFormat,
                        onShowPicker: (context, currentValue) async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(
                                currentValue ?? DateTime.now()),
                          );
                          return DateTimeField.convert(time);
                        },
                      ),
                    ),
                  ),
                ],
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
                  if (_bedTimeController.text.isNotEmpty &&
                      _wakeTimeController.text.isNotEmpty &&
                      (_bedTimeController.text != _wakeTimeController.text)) {
                    data.bedTime = _bedTimeController.text;
                    data.wakeTime = _wakeTimeController.text;
                    updateRecord();
                    Navigator.of(context).pushNamed(
                      HomePage.routeName,
                      arguments: data,
                    );
                  } else {
                    if (_bedTimeController.text == _wakeTimeController.text) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              "Opps Sorry",
                            ),
                            content: const Text(
                                "Please both required times can not be same!"),
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
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              "Opps Sorry",
                            ),
                            content: const Text(
                                "Please Enter all required times before we continue"),
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
                  }
                },
                // style:
                child: Container(
                  width: 110,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "let's begin",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
