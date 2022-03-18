import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/screens/settings/components/body.dart';

class SettingsScreen extends StatelessWidget {
  static String routeName = "/settings";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "ST_title".tr,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
