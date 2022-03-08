import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  var storageBox = GetStorage();
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final email = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void login() {
    storageBox.write("userDetails", {
      "name": name.text,
      "phoneNumber": phoneNumber.text,
      "email": email.text,
    });
    storageBox.write("isLoggedIn", "true");
    Get.offAllNamed(Routes.HOME);
  }
}
