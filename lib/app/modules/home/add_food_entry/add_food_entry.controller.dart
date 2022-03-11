import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_diary/app/modules/home/food_details.model.dart';
import 'package:food_diary/app/modules/home/home.controller.dart';
import 'package:get/get.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddFoodEntryController extends GetxController {
  //TODO: Implement AddFoodEntryController
  HomeController homeController = Get.put(HomeController());

  final count = 0.obs;
  //text controller
  var foodName = TextEditingController();
  var calories = TextEditingController();
  var fat = TextEditingController();
  var carbohydrates = TextEditingController();
  //image files
  Rx<String> uploadedImageUrl = "".obs;
  late File uploadedImageFile;
  // firebase services
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  //data model
  final foodDetailsData = FoodDetails().obs;

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
    feedValues();
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  loadJson() {
    return rootBundle.loadString("assets/food-details.json");
  }

  feedValues() async {
    var feedLoadedData = await loadJson();
    foodDetailsData.value = FoodDetails.fromJson(jsonDecode(feedLoadedData));
    print("feeded value");
  }

  Future<void> addFood() async {
    //starting dialog
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
          'calories': calories.text,
          'fat': fat.text,
          'carbohydrates': carbohydrates.text,
        })
        .then((value) => {
              Get.back(),
              Get.snackbar("Food Added", "Successfully added food"),
              resetFields(),
              homeController.getFoodList(),
            })
        .catchError(
            (error) => Get.snackbar("Failed to add food", error.toString()));
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
      } catch (e) {
        Get.snackbar("Error", e.toString());
      }
      log("--------------------------");
      log("uploadFileToServer");
    } //
  }

  resetFields() {
    isPhoto.value = false;

    uploadedImageUrl.value = "";
    foodName.text = "";
    calories.text = "";
    fat.text = "";
    carbohydrates.text = "";
  }

  void getFoodDetailsBasedOnDropDown(newValue) {
    for (int i = 0; i < foodDetailsData.value.foods!.length; i++) {
      if (foodDetailsData.value.foods?.elementAt(i).name == newValue) {
        foodName.text = foodDetailsData.value.foods!.elementAt(i).name!;
        calories.text =
            foodDetailsData.value.foods!.elementAt(i).calories.toString();
        fat.text = foodDetailsData.value.foods!.elementAt(i).fat.toString();
        carbohydrates.text =
            foodDetailsData.value.foods!.elementAt(i).carbohydrates.toString();
      }
    }

    // var element = foodDetailsData.value.foods?.elementAt(0).name;
    // if (element.name == newValue) {
    //   foodName.text = element.name;
    //   carbs.text = element.carbs;
    //   proteins.text = element.proteins;
    //   nutrients.text = element.nutrients;
    // }
  }

  // Future<void> uploadFileToServer(file) async {

  // }
}
