import 'dart:convert';

class Favorite {
  final String id;
  final String productId;
  Favorite({
    required this.id,
    required this.productId,
  });

  Favorite copyWith({
    String? id,
    String? productId,
  }) {
    return Favorite(
      id: id ?? this.id,
      productId: productId ?? this.productId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
    };
  }

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      id: map['id'] ?? '',
      productId: map['productId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Favorite.fromJson(String source) =>
      Favorite.fromMap(json.decode(source));

  @override
  String toString() => 'Favorite(id: $id, productId: $productId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Favorite && other.id == id && other.productId == productId;
  }

  @override
  int get hashCode => id.hashCode ^ productId.hashCode;
}
