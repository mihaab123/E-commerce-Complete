import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/controllers/client_controller.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/favourite/components/body.dart';

class FavouriteScreen extends StatelessWidget {
  static String routeName = "/favourite";
  ClientController _clientController = Get.find<ClientController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "FV_title".tr,
            style: TextStyle(color: Colors.black),
          ),
          Obx(() {
            return Text(
              "${_clientController.client!.favouriteModel.length} " +
                  "CT_items".tr,
              style: Theme.of(context).textTheme.caption,
            );
          }),
        ],
      ),
    );
  }
}
