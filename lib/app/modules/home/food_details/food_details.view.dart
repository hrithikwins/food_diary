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
        title: Text('FoodDetailsView'),
        centerTitle: true,
      ),

      body: Center(
        child: Text(
          'FoodDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}