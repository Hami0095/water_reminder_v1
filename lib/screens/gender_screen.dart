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
    bool _flag = false;
    int choose = 0;
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
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
                                if (_flag == true) {
                                  _flag = false;
                                  setState(() {
                                    selected = false;
                                    _flag = selected!;
                                    choose = 1;
                                  });
                                }
                                _flag = selected!;
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
                                if (_flag == true) {
                                  _flag = false;
                                  setState(() {
                                    selected = false;
                                    choose = 2;
                                    _flag = selected!;
                                  });
                                }
                                _flag = selected!;
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
                        Navigator.of(context).pushNamed(WeightScreen.routeName);
                      },
                    );
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
              ],
            ),
          ),
        ));
  }
}
