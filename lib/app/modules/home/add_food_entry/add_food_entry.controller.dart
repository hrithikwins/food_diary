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

class AddFoodEntryController extends GetxController {
  //TODO: Implement AddFoodEntryController

  final count = 0.obs;
  var foodName = TextEditingController();
  var carbs = TextEditingController();
  var proteins = TextEditingController();
  var nutrients = TextEditingController();
  Rx<String> uploadedImageUrl = Resources.foodUpload.obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

// Create a CollectionReference called users that references the firestore collection
  CollectionReference foodCollection =
      FirebaseFirestore.instance.collection('food');

  final ImagePicker _picker = ImagePicker();
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

  uploadImage() async {
    Get.bottomSheet(imagePicketComponent());
    // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  }

  pickImageFromGallery() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      isPhoto.value = true;
    }
    // gallery image
  }

  pickImageFromCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      isPhoto.value = true;
    }
  }

  imagePicketComponent() {
    return Container(
      color: Colors.white,
      child: SizedBox(
        width: Get.width,
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => pickImageFromGallery(),
              child: Container(
                padding: EdgeInsets.all(12),
                color: Colors.white,
                child: Icon(Icons.image),
              ),
            ),
            12.heightBox,
            InkWell(
              onTap: () => pickImageFromCamera(),
              child: Container(
                padding: EdgeInsets.all(12),
                color: Colors.white,
                child: Icon(Icons.camera),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
