import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shop_app/models/category.dart';

class SearchModel {
  String name;
  List<String> categories;
  SearchModel({
    required this.name,
    required this.categories,
  });

  SearchModel copyWith({
    String? name,
    List<String>? categories,
  }) {
    return SearchModel(
      name: name ?? this.name,
      categories: categories ?? this.categories,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'categories': categories,
    };
  }

  factory SearchModel.fromMap(Map<String, dynamic> map) {
    return SearchModel(
      name: map['name'] ?? '',
      categories: List<String>.from(map['categories']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchModel.fromJson(String source) =>
      SearchModel.fromMap(json.decode(source));

  @override
  String toString() => 'SearchModel(name: $name, categories: $categories)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchModel &&
        other.name == name &&
        listEquals(other.categories, categories);
  }

  @override
  int get hashCode => name.hashCode ^ categories.hashCode;
}
