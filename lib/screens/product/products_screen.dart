import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/controllers/product_controller.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/product/components/body.dart';
import 'package:shop_app/screens/product/components/search.dart';

class ProductsScreen extends StatelessWidget {
  static String routeName = "/products";
  final AllProducts _productController = Get.find<AllProducts>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      endDrawer: Search(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "PR_title".tr,
            style: TextStyle(color: Colors.black),
          ),
          Obx(() {
            return Text(
              "${_productController.products.length} " + "CT_items".tr,
              style: Theme.of(context).textTheme.caption,
            );
          }),
        ],
      ),
    );
  }
}
