import 'dart:convert';

class Data {
  String uid;
  String gender;
  String weight;
  String wakeTime;
  String bedTime;
  Data({
    required this.gender,
    required this.uid,
    required this.weight,
    required this.wakeTime,
    required this.bedTime,
  });

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

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      gender: map['gender'] ?? '',
      weight: map['weight'] ?? '',
      wakeTime: map['wakeTime'] ?? '',
      bedTime: map['bedTime'] ?? '',
      uid: map['bedTime'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));
}
