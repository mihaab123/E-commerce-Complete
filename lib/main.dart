import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/services/localization/localization.dart';
import 'package:shop_app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.topLevel,
      debugShowCheckedModeBanner: false,
      fallbackLocale: Locale('en', 'US'),
      // locale: Get.deviceLocale,
      builder: (BuildContext context, Widget? widget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.1),
          child: widget!,
        );
      },

      localizationsDelegates: [
        // this line is important
        RefreshLocalizations.delegate,
      ],
      locale: Locale('en', 'US'),
      translations: LocalizationService(),
      title: 'Shop App',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
