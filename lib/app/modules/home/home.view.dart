import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../routes/app_pages.dart';
import 'home.controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Dairy'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {Get.toNamed(Routes.ADD_FOOD_ENTRY)},
        label: Row(
          children: [
            Icon(Icons.fastfood_outlined),
            4.widthBox,
            Text("New Food Entry"),
          ],
        ),
      ),
      body: Column(
        children: [
          //food card
          for (var foodInfo in controller.foodList)
            Container(
              child: Text(foodInfo["name"]),
            )
        ],
      ),
    );
  }
}
