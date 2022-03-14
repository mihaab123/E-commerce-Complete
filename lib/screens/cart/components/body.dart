import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/info_snackbar.dart';
import 'package:shop_app/controllers/client_controller.dart';
import 'package:shop_app/models/Cart.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ClientController _clientController = Get.find<ClientController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView.builder(
          itemCount: _clientController.client!.cardTokens.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(_clientController.client!.cardTokens[index].product.uuid
                  .toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() async {
                  //demoCarts.removeAt(index);
                  await _clientController.removeProductFromCard(
                      _clientController.client!.cardTokens[index].product);
                  InfoSnackBar().infoSnackbar('Remove from Cart!',
                      'Removed ${_clientController.client!.cardTokens[index].product.title}');
                });
              },
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Spacer(),
                    SvgPicture.asset("assets/icons/Trash.svg"),
                  ],
                ),
              ),
              child:
                  CartCard(cart: _clientController.client!.cardTokens[index]),
            ),
          ),
        ),
      );
    });
  }
}
