import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/controllers/product_controller.dart';
import 'package:shop_app/screens/product/products_screen.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  final AllProducts _productController = Get.find<AllProducts>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SectionTitle(
                title: "HS_popular_products".tr,
                press: () =>
                    Navigator.pushNamed(context, ProductsScreen.routeName)),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  _productController.products.length,
                  (index) {
                    if (_productController.products[index].isPopular)
                      return ProductCard(
                          product: _productController.products[index]);

                    return SizedBox
                        .shrink(); // here by default width and height is 0
                  },
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
              ],
            ),
          )
        ],
      );
    });
  }
}
