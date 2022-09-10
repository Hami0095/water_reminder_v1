import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:roundcheckbox/roundcheckbox.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:water_reminder_v1/Providers/firebase_provider.dart';
import 'package:water_reminder_v1/widgets/continue_btn.dart';

import '../model/user_data.dart';
import '../screens/weight_screen.dart';

class GenderScreen extends StatefulWidget {
  static const routeName = "/gender-screen";
  const GenderScreen({Key? key}) : super(key: key);

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  UserData data = UserData(
    gender: "",
    uid: "user1",
    weight: "",
    wakeTime: "",
    bedTime: "",
  );

  int choose = 0;

  void setGender() {
    String gender = " ";
    if (choose == 0) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "Opps Sorry",
            ),
            content: const Text("Please choose one gender"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Column(
                  children: [
                    Divider(
                      color: Theme.of(context).dividerColor,
                    ),
                    const Text(
                      "OK",
                    ),
                    Divider(
                      color: Theme.of(context).dividerColor,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    } else {
      if (choose == 1) {
        gender = "Male";
      } else if (choose == 2) {
        gender = "Female";
      }
      data.set(
        gender,
        data.weight,
        data.wakeTime,
        data.bedTime,
      );
      Navigator.of(context).pushNamed(WeightScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final fbData = Provider.of<FirebaseProvider>(context);
    bool flag = false;
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Card(
                    color: const Color.fromARGB(255, 153, 202, 241),
                    elevation: 1.5,
                    child: Center(
                      child: Text(
                        "Choose your Gender",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    children: [
                      Divider(
                        color: Theme.of(context).dividerColor,
                        endIndent: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            RoundCheckBox(
                              onTap: (selected) {
                                if (flag == true) {
                                  flag = false;

                                  setState(() {
                                    selected = false;
                                    flag = selected!;
                                  });
                                }
                                flag = selected!;
                                choose = 1;
                              },
                              size: 25,
                              checkedWidget: Icon(
                                Icons.circle,
                                color: Theme.of(context).iconTheme.color,
                                size: 15,
                              ),
                              checkedColor:
                                  const Color.fromARGB(255, 153, 202, 241),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Male",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: Theme.of(context).dividerColor,
                        endIndent: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            RoundCheckBox(
                              onTap: (selected) {
                                if (flag == true) {
                                  flag = false;
                                  setState(
                                    () {
                                      selected = false;
                                      flag = selected!;
                                    },
                                  );
                                }
                                choose = 2;
                                flag = selected!;
                              },
                              checkedWidget: Icon(
                                Icons.circle,
                                color: Theme.of(context).iconTheme.color,
                                size: 15,
                              ),
                              checkedColor:
                                  const Color.fromARGB(255, 153, 202, 241),
                              size: 25,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Female",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Theme.of(context).dividerColor),
                    ],
                  ),
                ),
                ContinueButton(
                  onPressed: () {
                    setState(
                      () {
                        setGender();
                        fbData.tempdata.set(
                          data.gender,
                          data.bedTime,
                          data.wakeTime,
                          data.weight,
                        );
                        fbData.updateRecord(fbData.tempdata.uid);
                        debugPrint(fbData.tempdata.gender);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
