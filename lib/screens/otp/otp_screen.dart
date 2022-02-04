import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/utils.dart';
import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("OT_title".tr),
      ),
      body: Body(),
    );
  }
}
