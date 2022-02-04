import 'package:get/get.dart';

class AppStartService extends GetxController {
  RxBool inited = false.obs;
//ConsumerController consumerController = Get.find<ConsumerController>();

  init() {
    /*consumerController.loadConsumer().listenAndPump((consumer) async {
      print(consumer);
      if (consumer is Consumer) {
        inited.value= true;
        print('consumer loaded');
      }else{
        inited.value= false;
      }
    });*/
  }
}
