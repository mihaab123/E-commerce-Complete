import 'package:flutter/material.dart';
import 'package:shop_app/utils.dart';
import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SI_forgot_pass".tr),
      ),
      body: Body(),
    );
  }
}
