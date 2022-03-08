import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddFoodEntryController extends GetxController {
  //TODO: Implement AddFoodEntryController

  final count = 0.obs;
  var foodName = TextEditingController();
  var carbs = TextEditingController();
  var proteins = TextEditingController();
  var nutrients = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
