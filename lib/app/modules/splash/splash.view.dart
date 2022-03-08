import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'splash.controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to Food Dairy',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
