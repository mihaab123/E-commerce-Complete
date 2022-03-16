import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_app/controllers/client_controller.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/favorite.dart';
import 'package:shop_app/screens/details/details_screen.dart';

import '../utils.dart';
import '../size_config.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;
  final ClientController _clientController = Get.find<ClientController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: product),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: product.uuid.toString(),
                    child: Image.asset(product.images[0]),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.title,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  GetBuilder<ClientController>(
                    builder: ((_clientController) {
                      bool isFavourite = _clientController
                          .client!.favouriteModel
                          .contains(Favorite(productId: product.uuid));
                      return InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          if (isFavourite)
                            _clientController.removeFromFavorite(product.uuid);
                          else
                            _clientController.addToFavorite(product.uuid);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(8)),
                          height: getProportionateScreenWidth(28),
                          width: getProportionateScreenWidth(28),
                          decoration: BoxDecoration(
                            color: isFavourite
                                ? kPrimaryColor.withOpacity(0.15)
                                : kSecondaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/Heart Icon_2.svg",
                            color: isFavourite
                                ? Color(0xFFFF4848)
                                : Color(0xFFDBDEE4),
                          ),
                        ),
                      );
                    }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
