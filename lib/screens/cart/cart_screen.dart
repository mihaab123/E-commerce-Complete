import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/controllers/client_controller.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  ClientController _clientController = Get.find<ClientController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "CT_title".tr,
            style: TextStyle(color: Colors.black),
          ),
          Obx(() {
            return Text(
              "${_clientController.client!.cardTokens.length} " + "CT_items".tr,
              style: Theme.of(context).textTheme.caption,
            );
          }),
        ],
      ),
    );
  }
}
