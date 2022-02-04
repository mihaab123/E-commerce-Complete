import 'package:flutter/material.dart';
import 'package:shop_app/utils.dart';
import 'components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("LS_title".tr),
      ),
      body: Body(),
    );
  }
}
