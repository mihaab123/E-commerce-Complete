import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Product {
  String? uuid;
  final String title;
  final String description;
  final String categoryId;
  final List<String> images;
  final List<String> colors;
  final double rating;
  final double price;
  final bool isFavourite;
  final bool isPopular;

  Product({
    String? uuid,
    required this.title,
    required this.description,
    required this.categoryId,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    required this.price,
    this.isFavourite = false,
    this.isPopular = false,
  }) : uuid = uuid ?? Uuid().v4();

  Product copyWith({
    String? uuid,
    String? title,
    String? description,
    String? categoryId,
    List<String>? images,
    List<String>? colors,
    double? rating,
    double? price,
    bool? isFavourite,
    bool? isPopular,
  }) {
    return Product(
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
      description: description ?? this.description,
      categoryId: categoryId ?? this.categoryId,
      images: images ?? this.images,
      colors: colors ?? this.colors,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      isFavourite: isFavourite ?? this.isFavourite,
      isPopular: isPopular ?? this.isPopular,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'title': title,
      'description': description,
      'categoryId': categoryId,
      'images': images,
      'colors': colors,
      'rating': rating,
      'price': price,
      'isFavourite': isFavourite,
      'isPopular': isPopular,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      uuid: map['uuid'] ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      categoryId: map['categoryId'] ?? '',
      images: List<String>.from(map['images']),
      colors: List<String>.from(map['colors']),
      rating: map['rating']?.toDouble() ?? 0.0,
      price: map['price']?.toDouble() ?? 0.0,
      isFavourite: map['isFavourite'] ?? false,
      isPopular: map['isPopular'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(uuid: $uuid, title: $title, description: $description,categoryId: $categoryId, images: $images, colors: $colors, rating: $rating, price: $price, isFavourite: $isFavourite, isPopular: $isPopular)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.uuid == uuid &&
        other.title == title &&
        other.description == description &&
        other.categoryId == categoryId &&
        listEquals(other.images, images) &&
        listEquals(other.colors, colors) &&
        other.rating == rating &&
        other.price == price &&
        other.isFavourite == isFavourite &&
        other.isPopular == isPopular;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        title.hashCode ^
        description.hashCode ^
        categoryId.hashCode ^
        images.hashCode ^
        colors.hashCode ^
        rating.hashCode ^
        price.hashCode ^
        isFavourite.hashCode ^
        isPopular.hashCode;
  }
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    uuid: "1",
    categoryId: "",
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      Color(0xFFF6625E).toString(),
      Color(0xFF836DB8).toString(),
      Color(0xFFDECB9C).toString(),
      Colors.white.toString(),
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    uuid: "2",
    categoryId: "",
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    colors: [
      Color(0xFFF6625E).toString(),
      Color(0xFF836DB8).toString(),
      Color(0xFFDECB9C).toString(),
      Colors.white.toString(),
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    uuid: "3",
    categoryId: "",
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      Color(0xFFF6625E).toString(),
      Color(0xFF836DB8).toString(),
      Color(0xFFDECB9C).toString(),
      Colors.white.toString(),
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    uuid: '4',
    categoryId: "",
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      Color(0xFFF6625E).toString(),
      Color(0xFF836DB8).toString(),
      Color(0xFFDECB9C).toString(),
      Colors.white.toString(),
    ],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
