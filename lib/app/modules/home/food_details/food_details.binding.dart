import 'package:get/get.dart';

import 'food_details.controller.dart';

class FoodDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodDetailsController>(
      () => FoodDetailsController(),
    );
  }
}
