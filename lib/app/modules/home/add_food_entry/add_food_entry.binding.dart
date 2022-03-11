import 'package:get/get.dart';

import 'add_food_entry.controller.dart';

class AddFoodEntryBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<AddFoodEntryController>(
    //   () => AddFoodEntryController(),
    // );
    Get.put(AddFoodEntryController());
  }
}
