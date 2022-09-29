import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/user_data.dart';

class FirebaseProvider extends ChangeNotifier {
  UserData tempData = UserData(
    uid: "user1",
    gender: "",
    bedTime: "",
    wakeTime: "",
    weight: "",
  );

  final databaseReference = FirebaseFirestore.instance;

  final List<UserData> _dataFromFirebase = [];
  List<UserData> get dataFromFirebase {
    return _dataFromFirebase;
  }

  UserData findByUID(String id) {
    return dataFromFirebase.firstWhere((element) => element.uid == id);
  }

  void deleteUser(String id) {
    dataFromFirebase.removeWhere((user) => user.uid == id);
    final data = dataFromFirebase.firstWhere((user) => user.uid == id);
    databaseReference.collection("data").doc(data.uid).delete().then(
          (doc) => debugPrint("Document deleted"),
          onError: (e) => debugPrint("Error updating document $e"),
        );
    notifyListeners();
    //TODO You will have to take the user to the signIn page -- like somehow it should be maintained...
  }

  void updateRecord(String id) async {
    try {
      // ignore: iterable_contains_unrelated_type
      if (!dataFromFirebase.any((element) => element.uid == tempData.uid)) {
        dataFromFirebase.add(tempData);
      }
      final data = dataFromFirebase.firstWhere((element) => element.uid == id);
      await databaseReference.collection("data").doc(tempData.uid).set({
        'gender': data.gender,
        'bedTime': data.bedTime,
        'wakeTime': data.wakeTime,
        'weight': data.weight,
      });
      notifyListeners();
    } catch (e) {
      debugPrint("Got an error eh?, well the error is : $e");
    }
  }

  void getData(String id) async {
    try {
      final data = dataFromFirebase.firstWhere((element) => element.uid == id);
      await databaseReference
          .collection('data')
          .doc(data.uid)
          .get()
          .then((DocumentSnapshot doc) {
        data.setFromMap(doc.data() as Map<String, dynamic>);
      });
      notifyListeners();
    } catch (e) {
      debugPrint("the error we got $e");
    }
  }
}
