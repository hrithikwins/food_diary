import 'package:get/get.dart';

import 'splash.controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    // Get.lazyPut<SplashController>(
    //   () => SplashController(),
    // );
  }
}
