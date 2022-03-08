import 'package:food_diary/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  var storageBox = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    storageBox.writeIfNull("isLoggedIn", "false");
    if (storageBox.read("isLoggedIn") == "true") {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
