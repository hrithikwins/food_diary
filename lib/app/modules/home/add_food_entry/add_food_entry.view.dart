import 'package:flutter/material.dart';
import 'package:food_diary/app/modules/home/home.controller.dart';
import 'package:food_diary/utils/resources.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../components/image_picker_component.dart';
import 'add_food_entry.controller.dart';

//=============================================================================
//
//                                         ADD FOOD ENTRY
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
              Obx(
                () => DropdownButtonFormField(
                  hint: Text(
                    'Select Food',
                  ),
                  onChanged: (newValue) {
                    // controller.foodDetailsData.value.elementAt(index) =
                    //     (newValue.toString());
                    // controller.getVehicleListByVendor();
                    // print(controller.vendor.value);
                  },
                  // value: controller.foodDetailsData.value.name,
                  value: "Select Food",
                  items: [
                    DropdownMenuItem(
                      child: Text("Select Food"),
                      value: "Select Food",
                    ),
                    for (var index = 0;
                        index < controller.foodDetailsData.value.foods!.length;
                        index++)
                      DropdownMenuItem(
                        child: Text(controller.foodDetailsData.value.foods!
                            .elementAt(index)
                            .name
                            .toString()),
                        value: controller.foodDetailsData.value.foods!
                            .elementAt(index)
                            .name
                            .toString(),
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
