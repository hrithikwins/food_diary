import 'package:flutter/material.dart';
import 'package:food_diary/app/modules/home/home.controller.dart';
import 'package:food_diary/utils/resources.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'add_food_entry.controller.dart';

//=============================================================================
//
//                                         ADD FOOD ENTRY
//                   ------------------- widgets -------------------
//                                              imagePickerBottomSheet
//=============================================================================
class AddFoodEntryView extends GetView<AddFoodEntryController> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Food Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
            vertical: 20,
          ),
          child: Column(
            children: [
              //pick image
              InkWell(
                onTap: () => Get.bottomSheet(imagePickerBottomSheet()),
                child: Stack(
                  children: [
                    Obx(
                      () => controller.isPhoto.value
                          ? Image.file(controller.uploadedImageFile)
                          : CircleAvatar(
                              radius: 100,
                              backgroundImage:
                                  AssetImage(Resources.foodUpload)),
                    ),
                    Positioned(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.camera_rounded,
                          color: Colors.white,
                        ),
                      ),
                      bottom: 10,
                      right: 10,
                    ),
                  ],
                ),
              ),
              10.heightBox,
              TextFormField(
                controller: controller.foodName,
                decoration: InputDecoration(
                  label: Text("Food Name"),
                ),
              ),
              20.heightBox,
              TextFormField(
                controller: controller.carbs,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Carbs(in gms)"),
                ),
              ),
              20.heightBox,
              TextFormField(
                controller: controller.proteins,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Proteins(in gms)"),
                ),
              ),
              20.heightBox,
              TextFormField(
                controller: controller.nutrients,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Nutrients (in gms)"),
                ),
              ),
              20.heightBox,
              ElevatedButton(
                onPressed: controller.addFood,
                child: Text("ADD"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
