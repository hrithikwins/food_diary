import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'add_food_entry.controller.dart';

class AddFoodEntryView extends GetView<AddFoodEntryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddFoodEntryView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddFoodEntryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
