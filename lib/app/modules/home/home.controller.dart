import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final foodList = [].obs;
  var storageBox = GetStorage();
  var userDetails = {}.obs;

  //document stream to get partcular data
  // Stream documentStream = FirebaseFirestore.instance
  //     .collection('food')
  //     .doc('4kcm4MYUHPRQjcFWikjo')
  //     .snapshots();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    userDetails.value = storageBox.read("userDetails");
    getFoodList();
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void getFoodList() {
    final Future<void> foodStream = FirebaseFirestore.instance
        .collection('food')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        foodList.add(doc);
      });
    });
  }
}
