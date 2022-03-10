import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_diary/utils/resources.dart';
import 'package:get/get.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddFoodEntryController extends GetxController {
  //TODO: Implement AddFoodEntryController

  final count = 0.obs;
  var foodName = TextEditingController();
  var carbs = TextEditingController();
  var proteins = TextEditingController();
  var nutrients = TextEditingController();
  Rx<String> uploadedImageUrl = "".obs;
  late File uploadedImageFile;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

// Create a CollectionReference called users that references the firestore collection
  CollectionReference foodCollection =
      FirebaseFirestore.instance.collection('food');
  // Firebase storage reference
  firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
      .ref()
      .child('images')
      .child('foodImage.png');

  final ImagePicker picker = ImagePicker();
  late XFile? photo;
  final isPhoto = false.obs;

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

  Future<void> addFood() async {
    Get.dialog(
      Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: Container(child: CircularProgressIndicator()),
        ),
      ),
    );

    ///before adding the data to the firestore, we need to check if the image has been uploaded to cloud firestoree
    await uploadImageToFirestore();

    ///Call the user's CollectionReference to add a new user
    await foodCollection
        .add({
          'imageUrl': uploadedImageUrl.value,
          'name': foodName.text,
          'carbs': carbs.text,
          'proteins': proteins.text,
          'nutrients': nutrients.text,
        })
        .then((value) => {
              Get.snackbar("Food Added", "Successfully added food"),
              resetFields(),
            })
        .catchError(
            (error) => Get.snackbar("Failed to add food", error.toString()));
    Get.back();
  }

  pickImageFromGallery() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    setPhotoInView(photo);
  }

  pickImageFromCamera() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    setPhotoInView(photo);
  }

  void setPhotoInView(photo) {
    if (photo != null) {
      isPhoto.value = true;
      uploadedImageFile = File(photo.path); //this converts to file..not needed
      Get.back();
    }
  }

  Future<void> uploadImageToFirestore() async {
    if (uploadedImageFile != null) {
      // String downloadURL = await firebase_storage.FirebaseStorage.instance
      //     .ref('users/123/avatar.jpg')
      //     .getDownloadURL();

      // // Within your widgets:
      // // Image.network(downloadURL);
      // uploadedImageUrl.value = downloadURL;
      // await uploadFileToServer(uploadedImageFile);
      // Create your custom metadata.
      try {
        // Pass metadata to any file upload method e.g putFile.
        await firebase_storage.FirebaseStorage.instance
            .ref('uploads/' + foodName.text + '.png')
            .putFile(uploadedImageFile);
//after uploading downloading now
        uploadedImageUrl.value = await firebase_storage.FirebaseStorage.instance
            .ref('uploads/' + foodName.text + '.png')
            .getDownloadURL();
        log("--------------------------");
        log(uploadedImageUrl.value);
        // } on firebase_core.FirebaseException catch (e) {
      } catch (e) {
        // e.g, e.code == 'canceled'
      }
      log("--------------------------");
      log("uploadFileToServer");
    } //
  }

  resetFields() {
    isPhoto.value = false;
    uploadedImageUrl.value = "";
    foodName.text = "";
    carbs.text = "";
    proteins.text = "";
    nutrients.text = "";
  }

  // Future<void> uploadFileToServer(file) async {

  // }
}
