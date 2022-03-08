import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../routes/app_pages.dart';
import 'home.controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Dairy'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {Get.toNamed(Routes.ADD_FOOD_ENTRY)},
        label: Row(
          children: [
            Icon(Icons.fastfood_outlined),
            4.widthBox,
            Text("New Food Entry"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: Text(
                  "Hii " + controller.userDetails.value["name"].toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              //checking for food info
              controller.foodList.isEmpty
                  ? SizedBox(
                      height: Get.height * 0.8,
                      child: Center(
                        child: "Click on the button below to create your entry"
                            .text
                            .gray500
                            .make(),
                      ),
                    )
                  : "".text.make(),
              //food card
              for (var foodInfo in controller.foodList)
                InkWell(
                  onTap: () =>
                      Get.toNamed(Routes.FOOD_DETAILS, arguments: foodInfo),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Positioned(
                        // top: -20,
                        child: Container(
                          // width: Get.width,
                          margin: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          padding: EdgeInsets.all(
                            8.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 80,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  50,
                                                ),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  50,
                                                ),
                                                child: Image.network(
                                                  foodInfo["imageUrl"]
                                                      .toString(),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 6.0),
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    150,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        foodInfo["name"]
                                                            .toString(),
                                                        softWrap: false,
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.fade,
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      decoration: BoxDecoration(
                                                        color: Colors.orange,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          foodInfo["carbs"]
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w100,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Text(
                                              foodInfo["proteins"].toString(),
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            Text(
                                              foodInfo["nutrients"].toString(),
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            Text(
                                              foodInfo["info"].toString(),
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.lightBlueAccent,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              //end the loop above
            ],
          ),
        ),
      ),
    );
  }
}
