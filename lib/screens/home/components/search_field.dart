import 'package:flutter/material.dart';

import '../../../utils.dart';
import '../../../size_config.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChange;
  final double widthPercent;
  SearchField({
    Key? key,
    required this.controller,
    required this.onChange,
    this.widthPercent = 0.6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * widthPercent,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => onChange,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "HS_search_product".tr,
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
