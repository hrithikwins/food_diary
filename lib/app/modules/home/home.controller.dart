import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final foodList = [].obs;
  var storageBox = GetStorage();
  var userDetails = {}.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    userDetails.value = storageBox.read("userDetails");
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
