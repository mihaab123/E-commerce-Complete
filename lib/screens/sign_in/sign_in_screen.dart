import 'package:flutter/material.dart';

import 'components/body.dart';
import 'package:shop_app/utils.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SI_title".tr),
      ),
      body: Body(),
    );
  }
}
