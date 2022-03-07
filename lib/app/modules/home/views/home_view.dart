import 'package:flutter/material.dart';
import 'package:food_diary/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Dairy'),
        centerTitle: true,
      ),
      //extended floating action buttoni
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(Routes.ADD_PRODUCT);
        },
        label: Row(
          children: [
            Icon(Icons.fastfood_outlined),
            4.widthBox,
            Text("New Entry"),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Welcome to Food Dairy',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
