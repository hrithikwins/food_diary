import 'package:flutter/material.dart';
import 'package:food_diary/app/modules/home/home.controller.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'add_food_entry.controller.dart';

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
                onTap: () => controller.uploadImage(),
                child: Stack(
                  children: [
                    Obx(
                      () => CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage(
                          controller.uploadedImageUrl.value,
                        ),
                      ),
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
              TextFormField(
                controller: controller.foodName,
                decoration: InputDecoration(
                  label: Text("Food Name"),
                ),
              ),
              20.heightBox,
              TextFormField(
                controller: controller.carbs,
                decoration: InputDecoration(
                  label: Text("Carbs(in gms)"),
                ),
              ),
              20.heightBox,
              TextFormField(
                controller: controller.proteins,
                decoration: InputDecoration(
                  label: Text("Proteins(in gms)"),
                ),
              ),
              20.heightBox,
              TextFormField(
                controller: controller.nutrients,
                decoration: InputDecoration(
                  label: Text("Nutrients (in gms)"),
                ),
              ),
              20.heightBox,
              ElevatedButton(
                onPressed: controller.addFood,
                //  () => {
                //   homeController.foodList.add({
                //     "name": controller.foodName.text,
                //     "carbs": controller.carbs.text,
                //     "proteins": controller.proteins.text,
                //     "nutrients": controller.nutrients.text,
                // }),
                //   Get.snackbar("Added ", "Food"),
                // },
                child: Text("ADD"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
