import 'package:flutter/material.dart';
import 'package:shop_app/utils.dart';

class SearchItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Color unselectedColor;
  final Color selectedColor;
  final Function? press;
  SearchItem(this.title, this.isSelected, this.press,
      {this.unselectedColor = kSecondaryColor,
      this.selectedColor = kPrimaryColor});

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: press as void Function()?,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(15.0),
            child: AnimatedContainer(
                height: 34,
                duration: Duration(milliseconds: 350),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: isSelected ? selectedColor : unselectedColor),
                child: Center(
                    child: Padding(
                        padding: EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: Text(title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)))))),
      ));
}
