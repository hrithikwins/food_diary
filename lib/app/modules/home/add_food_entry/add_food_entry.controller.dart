import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddFoodEntryController extends GetxController {
  //TODO: Implement AddFoodEntryController

  final count = 0.obs;
  var foodName = TextEditingController();
  var carbs = TextEditingController();
  var proteins = TextEditingController();
  var nutrients = TextEditingController();
  Rx<String> uploadedImageUrl =
      'https://imgs.search.brave.com/qM-fEJzI5K7J1a4C_WO0kMKmHELxjJgQOptETRJSD8U/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly9ib3N0/b25hYmNkLm9yZy93/cC1jb250ZW50L3Vw/bG9hZHMvMjAxNy8w/OS9Gb29kLUljb24t/MDEucG5n'
          .obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

// Create a CollectionReference called users that references the firestore collection
  CollectionReference foodCollection =
      FirebaseFirestore.instance.collection('food');

  Future<void> addFood() {
    // Call the user's CollectionReference to add a new user
    return foodCollection
        .add({
          'imageUrl': uploadedImageUrl.value,
          'name': foodName.text,
          'carbs': carbs.text,
          'proteins': proteins.text,
          'nutrients': nutrients.text,
        })
        .then((value) => Get.snackbar("Food Added", "Successfully added food"))
        .catchError(
            (error) => Get.snackbar("Failed to add food", error.toString()));
  }

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

  uploadImage() {
    Get.snackbar("image", "uploaded");
  }
}
