import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'login.controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Diary'),
        centerTitle: true,
      ),
      //login with google
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: controller.name,
              decoration: InputDecoration(
                label: Text("Name"),
              ),
            ),
            20.heightBox,
            TextFormField(
              controller: controller.phoneNumber,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                label: Text("Phone Number"),
              ),
            ),
            20.heightBox,
            TextFormField(
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                label: Text("Email"),
              ),
            ),
            20.heightBox,
            ElevatedButton(
              onPressed: () => controller.login(),
              child: Text("Continue to Diary"),
            ),
          ],
        ),
      ),
    );
  }
}
