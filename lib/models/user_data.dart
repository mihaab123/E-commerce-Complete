import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class UserData {
  final String uid;
  final String fullName;
  final String name;
  final String surname;
  final int points;
  final double balance;
  final String email;
  final String phoneNumber;
  final Uint8List? photo;

  UserData({
    String? uid,
    required this.fullName,
    required this.name,
    required this.surname,
    required this.points,
    required this.balance,
    required this.email,
    required this.phoneNumber,
    this.photo,
  }) : this.uid = uid ?? Uuid().v1();

  UserData copyWith({
    String? uid,
    String? fullName,
    String? name,
    String? surname,
    int? points,
    double? balance,
    String? email,
    String? phoneNumber,
    Uint8List? photo,
  }) {
    return UserData(
      uid: uid ?? this.uid,
      fullName: fullName ?? this.fullName,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      points: points ?? this.points,
      balance: balance ?? this.balance,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'name': name,
      'surname': surname,
      'points': points,
      'balance': balance,
      'email': email,
      'phoneNumber': phoneNumber,
      'photo': this.photo != null ? Blob(this.photo!) : null,
    };
  }

  Map<String, dynamic> onlyTextMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'name': name,
      'surname': surname,
      'points': points,
      'balance': balance,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      uid: map['uid'],
      fullName: map['fullName'],
      name: map['name'],
      surname: map['surname'],
      points: map['points'],
      balance: map['balance'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      photo: map['photo']?.bytes ?? null,
    );
  }

  @override
  String toString() {
    return 'UserData(uid: $uid, fullName: $fullName,name:$name,surname:$surname,points:$points,balance:$balance, email: $email, phoneNumber: $phoneNumber, photo: ${photo?.length}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserData &&
        other.uid == uid &&
        other.fullName == fullName &&
        other.name == name &&
        other.surname == surname &&
        other.points == points &&
        other.balance == balance &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.photo == photo;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        fullName.hashCode ^
        name.hashCode ^
        surname.hashCode ^
        points.hashCode ^
        email.hashCode ^
        balance.hashCode ^
        phoneNumber.hashCode ^
        photo.hashCode;
  }
}
