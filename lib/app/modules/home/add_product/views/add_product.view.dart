import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_product.controller.dart';

class AddProductView extends GetView<AddProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddProductView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}