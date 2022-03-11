import 'package:flutter/material.dart';
import 'package:food_diary/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'food_details.controller.dart';

class FoodDetailsView extends GetView<FoodDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              Get.arguments["imageUrl"].toString(),
              fit: BoxFit.cover,
              height: 200,
            ),
            20.heightBox,
            20.heightBox,
            FoodInfo(
                title: "Food Name:", value: Get.arguments["name"].toString()),
            FoodInfo(
                title: "Calories:",
                value: Get.arguments["calories"].toString()),
            FoodInfo(title: "Fats:", value: Get.arguments["fat"].toString()),
            FoodInfo(
                title: "Carbohydrates:",
                value: Get.arguments["carbohydrates"].toString()),
            20.heightBox,
            ElevatedButton(
              onPressed: () => {Get.back()},
              child: Text("OK"),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodInfo extends StatelessWidget {
  const FoodInfo({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.teal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
