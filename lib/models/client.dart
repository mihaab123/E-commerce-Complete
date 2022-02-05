import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/favorite.dart';
import 'package:uuid/uuid.dart';

class Client {
  final String uuid;
  final String authid;
  final String firstname;
  final String secondName;
  final String phoneNumber;
  final String phoneNumberWithoutCounty;
  final String phoneNumberCountryCode;
  final String email;
  final String photoURL;
  final bool smsNotificationsEnabled;
  final bool emailNotificationsEnabled;
  final DateTime birthday;
  final String language;
  final List<Favorite> favouriteModel;
  final List<Cart> cardTokens;
  Client({
    String? uuid,
    DateTime? birthday,
    required this.authid,
    required this.firstname,
    required this.secondName,
    required this.phoneNumber,
    required this.phoneNumberWithoutCounty,
    required this.phoneNumberCountryCode,
    required this.email,
    required this.photoURL,
    required this.smsNotificationsEnabled,
    required this.emailNotificationsEnabled,
    required this.language,
    required this.favouriteModel,
    required this.cardTokens,
  })  : uuid = uuid ?? Uuid().v4(),
        birthday = birthday ?? DateTime.now();

  Client copyWith({
    String? uuid,
    String? authid,
    String? firstname,
    String? secondName,
    String? phoneNumber,
    String? phoneNumberWithoutCounty,
    String? phoneNumberCountryCode,
    String? email,
    String? photoURL,
    bool? smsNotificationsEnabled,
    bool? emailNotificationsEnabled,
    DateTime? birthday,
    String? language,
    List<Favorite>? favouriteModel,
    List<Cart>? cardTokens,
  }) {
    return Client(
      uuid: uuid ?? this.uuid,
      authid: authid ?? this.authid,
      firstname: firstname ?? this.firstname,
      secondName: secondName ?? this.secondName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      phoneNumberWithoutCounty:
          phoneNumberWithoutCounty ?? this.phoneNumberWithoutCounty,
      phoneNumberCountryCode:
          phoneNumberCountryCode ?? this.phoneNumberCountryCode,
      email: email ?? this.email,
      photoURL: photoURL ?? this.photoURL,
      smsNotificationsEnabled:
          smsNotificationsEnabled ?? this.smsNotificationsEnabled,
      emailNotificationsEnabled:
          emailNotificationsEnabled ?? this.emailNotificationsEnabled,
      birthday: birthday ?? this.birthday,
      language: language ?? this.language,
      favouriteModel: favouriteModel ?? this.favouriteModel,
      cardTokens: cardTokens ?? this.cardTokens,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'authid': authid,
      'firstname': firstname,
      'secondName': secondName,
      'phoneNumber': phoneNumber,
      'phoneNumberWithoutCounty': phoneNumberWithoutCounty,
      'phoneNumberCountryCode': phoneNumberCountryCode,
      'email': email,
      'photoURL': photoURL,
      'smsNotificationsEnabled': smsNotificationsEnabled,
      'emailNotificationsEnabled': emailNotificationsEnabled,
      'birthday': birthday.millisecondsSinceEpoch,
      'language': language,
      'favouriteModel': favouriteModel.map((x) => x.toMap()).toList(),
      'cardTokens': cardTokens.map((x) => x.toMap()).toList(),
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      uuid: map['uuid'] ?? '',
      authid: map['authid'] ?? '',
      firstname: map['firstname'] ?? '',
      secondName: map['secondName'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      phoneNumberWithoutCounty: map['phoneNumberWithoutCounty'] ?? '',
      phoneNumberCountryCode: map['phoneNumberCountryCode'] ?? '',
      email: map['email'] ?? '',
      photoURL: map['photoURL'] ?? '',
      smsNotificationsEnabled: map['smsNotificationsEnabled'] ?? false,
      emailNotificationsEnabled: map['emailNotificationsEnabled'] ?? false,
      birthday: DateTime.fromMillisecondsSinceEpoch(map['birthday']),
      language: map['language'] ?? '',
      favouriteModel: List<Favorite>.from(
          map['favouriteModel']?.map((x) => Favorite.fromMap(x))),
      cardTokens:
          List<Cart>.from(map['cardTokens']?.map((x) => Cart.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) => Client.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Client(uuid: $uuid, authid: $authid, firstname: $firstname, secondName: $secondName, phoneNumber: $phoneNumber, phoneNumberWithoutCounty: $phoneNumberWithoutCounty, phoneNumberCountryCode: $phoneNumberCountryCode, email: $email, photoURL: $photoURL, smsNotificationsEnabled: $smsNotificationsEnabled, emailNotificationsEnabled: $emailNotificationsEnabled, birthday: $birthday, language: $language, favouriteModel: $favouriteModel, cardTokens: $cardTokens)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Client &&
        other.uuid == uuid &&
        other.authid == authid &&
        other.firstname == firstname &&
        other.secondName == secondName &&
        other.phoneNumber == phoneNumber &&
        other.phoneNumberWithoutCounty == phoneNumberWithoutCounty &&
        other.phoneNumberCountryCode == phoneNumberCountryCode &&
        other.email == email &&
        other.photoURL == photoURL &&
        other.smsNotificationsEnabled == smsNotificationsEnabled &&
        other.emailNotificationsEnabled == emailNotificationsEnabled &&
        other.birthday == birthday &&
        other.language == language &&
        listEquals(other.favouriteModel, favouriteModel) &&
        listEquals(other.cardTokens, cardTokens);
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        authid.hashCode ^
        firstname.hashCode ^
        secondName.hashCode ^
        phoneNumber.hashCode ^
        phoneNumberWithoutCounty.hashCode ^
        phoneNumberCountryCode.hashCode ^
        email.hashCode ^
        photoURL.hashCode ^
        smsNotificationsEnabled.hashCode ^
        emailNotificationsEnabled.hashCode ^
        birthday.hashCode ^
        language.hashCode ^
        favouriteModel.hashCode ^
        cardTokens.hashCode;
  }
}
