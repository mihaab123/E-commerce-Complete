import 'dart:convert';

import 'package:uuid/uuid.dart';

class CategoryModel {
  String? uuid;
  final String title;
  CategoryModel({
    String? uuid,
    required this.title,
  }) : uuid = uuid ?? Uuid().v4();

  CategoryModel copyWith({
    String? uuid,
    String? title,
  }) {
    return CategoryModel(
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'title': title,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      uuid: map['uuid'] ?? '',
      title: map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  String toString() => 'Category(uuid: $uuid, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel && other.uuid == uuid && other.title == title;
  }

  @override
  int get hashCode => uuid.hashCode ^ title.hashCode;
}
