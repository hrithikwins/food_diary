import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
      body: Center(
        child: ElevatedButton(
          child: Text('Login'),
          onPressed: () {
            controller.login();
          },
        ),
      ),
      // body: Center(
      //   child: Text(
      //     'LoginView is working',
      //     style: TextStyle(fontSize: 20),
      //   ),
      // ),
    );
  }
}
