import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:water_reminder_v1/screens/home_screen.dart';

import '../model/data.dart';
import '../screens/settings_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home-page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final databaseReference = FirebaseFirestore.instance;
  var data = Data(
    uid: "user1",
    gender: "",
    bedTime: "",
    wakeTime: "",
    weight: "",
  );
  bool isInit = false;

  late double waterAmount;
  late var dbData;
  void calculateWater() {
    waterAmount = double.parse(data.weight) * (2 / 3);
    print("water: $waterAmount");
  }

  void getData() async {
    await databaseReference
        .collection('data')
        .doc(data.uid)
        .get()
        .then((DocumentSnapshot doc) {
      dbData = doc.data() as Map<String, dynamic>;
    });
    data.setFromMap(dbData);
    calculateWater();
    print(data.weight);
  }

  @override
  void didChangeDependencies() {
    if (isInit == false) {
      data = ModalRoute.of(context)!.settings.arguments as Data;

      getData();
      calculateWater();
      isInit = true;
    }
    super.didChangeDependencies();
  }

  // ignore: unnecessary_this

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return HomeScreen(intake: waterAmount);
        break;
      case 1:
        return const SettingsScreen();
        break;
      default:
        return HomeScreen(intake: waterAmount);
        break;
    }
  }

  int _selectedIndex = 0;

  void _onTap(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: getPage(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) => _onTap(value),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
              ),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_rounded,
              ),
              label: "settings",
            ),
          ],
        ),
      ),
    );
  }
}
