import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:point_citi_user/consumer/consumer_controller.dart';

class LocalizationController extends GetxController {
  //ConsumerController consumerController=Get.find<ConsumerController>();

  RxString activeLanguage = 'English'.obs;
  //ConsumerController controller=Get.find<ConsumerController>();

  static final locale = Locale('en', 'US');

  @override
  void onInit() {
    //activeLanguage.value=consumerController.consumer?.language??'English';
    super.onInit();
  }

  static final langs = [
    'English',
    'Russian',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('en', 'US'),
    Locale('ru', 'RU'),
  ];

  void changeLocale(String lang) {
    print(lang);
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
    /*controller.consumerRepository.setConsumer(
        consumer: controller.consumer!.copyWith(
          language: lang,
        ));
    controller.loadConsumer();*/
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
