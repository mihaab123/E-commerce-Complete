import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';
import 'package:shop_app/services/remote_config/remote_config_defaults.dart';

class RemoteConfigSetup extends GetxController {
  // init and set defaults from file
  RemoteConfig remoteConfig = RemoteConfig.instance
    ..setDefaults(remoConfDefaults);

  // Synchronize immediately
  Future<bool> syncRemote() async {
    late bool updated;
    try {
      remoteConfig.setConfigSettings(RemoteConfigSettings(
          fetchTimeout: Duration(seconds: 10),
          minimumFetchInterval: Duration(seconds: 10)));
      updated = await remoteConfig.fetchAndActivate();
      return updated;
    } catch (e) {
      return false;
    }
  }

  Map get getAll => remoteConfig.getAll();

  get lastPublishedIOSVersion =>
      remoteConfig.getString('last_published_ios_version');
  get lastPublishedAndroidVersion =>
      remoteConfig.getString('last_published_android_version');
  get minimumRequiredAndroidVersion =>
      remoteConfig.getString('minimum_required_android_version');
  get minimumRequiredIOSVersion =>
      remoteConfig.getString('minimum_required_ios_version');
  get allowToUse => remoteConfig.getBool('allow_to_use');
  get showInfoBanner => remoteConfig.getBool('show_info_banner');
  get infoBannerText => remoteConfig.getString('info_banner_text');

//  List get oTOTypesConfigsRawList =>
//      jsonDecode(remoteConfig.getString('OTO_Types_Configs'));
//
//
//  // Areyousure configs
//  //
//  List get areYouSurePopupConfigsRawList =>
//      jsonDecode(remoteConfig.getString('AreYouSurePopupConfigs'));
//
//
//
//  // Inner_Sales_Screen_Config
//  List get innerSalesScreenConfigRawList =>
//      jsonDecode(remoteConfig.getString('Inner_Sales_Screen_Config'));

//  List<IsscConfig> get innerSalesScreenConfig =>
//      innerSalesScreenConfigRawList.map((e) => IsscConfig.fromMap(e)).toList();
}
