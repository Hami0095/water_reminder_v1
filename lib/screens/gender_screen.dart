import 'package:flutter/material.dart';

import 'package:roundcheckbox/roundcheckbox.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/data.dart';
import '../screens/weight_screen.dart';

class GenderScreen extends StatefulWidget {
  static const routeName = "/gender-screen";
  const GenderScreen({Key? key}) : super(key: key);

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
//TODO we are going to use our provider here, and provider will manage the firebase stuff all at one place!
  @override
  Widget build(BuildContext context) {
    bool flag = false;
    int choose = 0;
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // TextBox
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
                              checkedColor: Color.fromARGB(255, 153, 202, 241),
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
                                  setState(() {
                                    selected = false;
                                    print(choose);
                                    flag = selected!;
                                  });
                                }
                                choose = 2;
                                flag = selected!;
                              },
                              checkedWidget: Icon(
                                Icons.circle,
                                color: Theme.of(context).iconTheme.color,
                                size: 15,
                              ),
                              checkedColor: Color.fromARGB(255, 153, 202, 241),
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
                    setState(
                      () {
                        //TODO add the gender to the database
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
                          //TODO lets see it later ho ye rha hai k, mujy ab data ko pass krna paryga in firebase provider
                          if (choose == 1) {
                            data.gender = "Male";
                            updateRecord();
                          } else if (choose == 2) {
                            data.gender = "Female";
                            updateRecord();
                          }
                          Navigator.of(context).pushNamed(
                            WeightScreen.routeName,
                            arguments: data,
                          );
                        }
                      },
                    );
                  },
                  // Continue button:
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
              ],
            ),
          ),
        ));
  }
}
