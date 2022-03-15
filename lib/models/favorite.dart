import 'dart:convert';

class Favorite {
  final String productId;
  Favorite({
    required this.productId,
  });

  Favorite copyWith({
    String? id,
    String? productId,
  }) {
    return Favorite(
      productId: productId ?? this.productId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
    };
  }

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      productId: map['productId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Favorite.fromJson(String source) =>
      Favorite.fromMap(json.decode(source));

  @override
  String toString() => 'Favorite(productId: $productId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Favorite && other.productId == productId;
  }

  @override
  int get hashCode => productId.hashCode;
}
