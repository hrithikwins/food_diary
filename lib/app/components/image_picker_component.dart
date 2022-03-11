import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../modules/home/add_food_entry/add_food_entry.controller.dart';

Widget imagePickerBottomSheet() {
  return GetBuilder<AddFoodEntryController>(
    init: AddFoodEntryController(),
    builder: (controller) => Container(
      color: Colors.white,
      child: SizedBox(
        width: Get.width,
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => controller.pickImageFromGallery(),
              child: Container(
                padding: EdgeInsets.all(12),
                color: Colors.white,
                child: Icon(Icons.image),
              ),
            ),
            12.heightBox,
            InkWell(
              onTap: () => controller.pickImageFromCamera(),
              child: Container(
                padding: EdgeInsets.all(12),
                color: Colors.white,
                child: Icon(Icons.camera),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
