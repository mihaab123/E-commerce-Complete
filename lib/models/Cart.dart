import 'dart:convert';

import 'Product.dart';

class Cart {
  final Product product;
  final int numOfItem;

  Cart({
    required this.product,
    required this.numOfItem,
  });

  Cart copyWith({
    Product? product,
    int? numOfItem,
  }) {
    return Cart(
      product: product ?? this.product,
      numOfItem: numOfItem ?? this.numOfItem,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'numOfItem': numOfItem,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      product: Product.fromMap(map['product']),
      numOfItem: map['numOfItem']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));

  @override
  String toString() => 'Cart(product: $product, numOfItem: $numOfItem)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Cart &&
        other.product == product &&
        other.numOfItem == numOfItem;
  }

  @override
  int get hashCode => product.hashCode ^ numOfItem.hashCode;
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(product: demoProducts[0], numOfItem: 2),
  Cart(product: demoProducts[1], numOfItem: 1),
  Cart(product: demoProducts[3], numOfItem: 1),
];
