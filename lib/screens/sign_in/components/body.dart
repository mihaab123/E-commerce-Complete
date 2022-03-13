import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/no_account_text.dart';
import 'package:shop_app/components/socal_card.dart';
import 'package:shop_app/controllers/client_controller.dart';
import 'package:shop_app/controllers/firebase_auth_controller.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  FirebaseAuthController _firebaseAuthController =
      Get.find<FirebaseAuthController>();
  ClientController _clientController = Get.find<ClientController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "SI_welcome_back".tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "SI_sign_email".tr,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () async {
                        await _firebaseAuthController.signInWithGoogle();
                        if (_firebaseAuthController.user.value !=
                            null) if (_clientController.client == null) {
                          await _clientController.setClientData(
                              newClient: _clientController.clientBlank.copyWith(
                                  firstname: _firebaseAuthController
                                      .user.value!.displayName));
                        }
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      },
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
