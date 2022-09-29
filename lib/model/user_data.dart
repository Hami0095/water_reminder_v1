import 'dart:convert';

class UserData {
  String uid;
  String gender;
  String weight;
  String wakeTime;
  String bedTime;
  UserData({
    required this.gender,
    required this.uid,
    required this.weight,
    required this.wakeTime,
    required this.bedTime,
  });

  set(String g, String w, String wTime, String bTime) {
    gender = g;
    weight = w;
    wakeTime = wTime;
    bedTime = bTime;
  }

  void setFromMap(Map<String, dynamic> map) {
    gender = map['gender'];
    weight = map['weight'] ?? '';
    wakeTime = map['wakeTime'] ?? '';
    bedTime = map['bedTime'] ?? '';
    uid = map['bedTime'] ?? '';
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'gender': gender,
      'weight': weight,
      'wakeTime': wakeTime,
      'bedTime': bedTime,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      gender: map['gender'] ?? '',
      weight: map['weight'] ?? '',
      wakeTime: map['wakeTime'] ?? '',
      bedTime: map['bedTime'] ?? '',
      uid: map['bedTime'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source));
}
