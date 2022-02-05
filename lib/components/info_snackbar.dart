import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class InfoSnackBar {
  void succesSnackbar(String title, String subtitle) {
    Get.isSnackbarOpen != true
        ? Get.snackbar(
            title,
            subtitle,
            backgroundGradient: LinearGradient(colors: [
              Color(0xff41B649),
              Color(0xff3FA846),
              Color(0xff38993F),
            ]),
            barBlur: 0,
            overlayBlur: 0,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            titleText: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
            messageText: Text(
              subtitle,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
            icon: SvgPicture.asset('assets/icons/succes.svg'),
            margin: EdgeInsets.fromLTRB(
                Get.width * 0.08, Get.height * 0.02, Get.width * 0.08, 0),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          )
        : () {};
  }

  void infoSnackbar(String title, String subtitle) {
    Get.isSnackbarOpen != true
        ? Get.snackbar(
            title,
            subtitle,
            backgroundGradient: LinearGradient(colors: [
              Color(0xffEADE4B),
              Color(0xffD2DD4B),
              Color(0xffBCC31D),
            ]),
            barBlur: 0,
            overlayBlur: 0,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            titleText: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
            messageText: Text(
              subtitle,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
            icon: SvgPicture.asset('assets/icons/succes.svg'),
            margin: EdgeInsets.fromLTRB(
                Get.width * 0.08, Get.height * 0.02, Get.width * 0.08, 0),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          )
        : () {};
  }

  void errorSnackbar(String title, String subtitle) {
    Get.isSnackbarOpen != true
        ? Get.snackbar(
            title,
            subtitle,
            backgroundGradient: LinearGradient(colors: [
              Color(0xffC9252D),
              Color(0xffD0353D),
              Color(0xff95242A),
            ]),
            barBlur: 0,
            overlayBlur: 0,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            titleText: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
            messageText: Text(
              subtitle,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
            icon: SvgPicture.asset('assets/icons/succes.svg'),
            margin: EdgeInsets.fromLTRB(
                Get.width * 0.08, Get.height * 0.02, Get.width * 0.08, 0),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          )
        : () {};
  }
}
