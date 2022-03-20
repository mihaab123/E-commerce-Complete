import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/controllers/product_controller.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final AllProducts _productController = Get.find<AllProducts>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView.builder(
          itemCount: _productController.foundedProducts.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child:
                ProductCard(product: _productController.foundedProducts[index]),
          ),
        ),
      );
    });
  }
}
