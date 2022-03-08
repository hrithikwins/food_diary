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

  final count = 0.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String name = "";
  String email = "";
  String photoURL = "";
  final isSignedIn = false.obs;

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
  void increment() => count.value++;

  Future<void> loginWithGoogle() async {
    print('Login with Google');
    await signInWithGoogle();
    GetStorage().write("isLoggedIn", "true");
    Get.snackbar(
      "Valid Email",
      "Congrats! you are now logged in",
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: EdgeInsets.all(8),
    );
    Get.offAndToNamed(Routes.SPLASH);
  }

  Future<String> signInWithGoogle() async {
    await Firebase.initializeApp();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User? user = authResult.user;

    name = user!.displayName!;
    email = user.email!;
    photoURL = user.photoURL!;

    final User? currentUser = _auth.currentUser;
    isSignedIn.value = true;
    print('signInWithGoogle succeeded: $user');
    return '$user';
  }

  Future<void> handleSignOut() => googleSignIn.disconnect();

  void switchGoogleAccounts() async {
    await googleSignIn.signOut();
    await googleSignIn.signIn();
  }
}
