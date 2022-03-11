import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../routes/app_pages.dart';
import 'home.controller.dart';

// class HomeView extends StatefulWidget {
//   @override
//   _HomeViewState createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   final Stream<QuerySnapshot> _usersStream =
//       FirebaseFirestore.instance.collection('food').snapshots();

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _usersStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Text("Loading");
//         }

//         return Scaffold(
//           body: ListView(
//             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//               Map<String, dynamic> data =
//                   document.data()! as Map<String, dynamic>;
//               return ListTile(
//                 title: Text(data['name']),
//                 subtitle: Text(data['carbs']),
//               );
//             }).toList(),
//           ),
//         );
//       },
//     );
//   }
// }

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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 5,
                  ),
                  child: InkWell(
                    onTap: () =>
                        Get.toNamed(Routes.FOOD_DETAILS, arguments: foodInfo),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          CategoryCard(
                            imageUrl: foodInfo["imageUrl"],
                            foodName: foodInfo["name"].toString(),
                          ),
                          5.heightBox,
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                foodIconInfo(
                                  foodInfo["calories"].toString(),
                                  Icons.fastfood_outlined,
                                  "Calories",
                                ),
                                foodIconInfo(
                                  foodInfo["fat"].toString(),
                                  Icons.fastfood_outlined,
                                  "Fat",
                                ),
                                foodIconInfo(
                                  foodInfo["carbohydrates"].toString(),
                                  Icons.fastfood_outlined,
                                  "Carbohydrates",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Stack(
                    //   children: [
                    //     SizedBox(
                    //       height: 40,
                    //     ),
                    //     Positioned(
                    //       // top: -20,
                    //       child: Container(
                    //         // width: Get.width,
                    //         margin: EdgeInsets.symmetric(
                    //           horizontal: 20,
                    //           vertical: 5,
                    //         ),
                    //         padding: EdgeInsets.all(
                    //           8.0,
                    //         ),
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(8.0),
                    //         ),
                    //         child: Container(
                    //           child: Row(
                    //             children: [
                    //               Container(
                    //                 child: Row(
                    //                   children: [
                    //                     SizedBox(
                    //                       width: 80,
                    //                       child: Column(
                    //                         children: [
                    //                           Container(
                    //                             height: 70,
                    //                             width: 70,
                    //                             decoration: BoxDecoration(
                    //                               color: Colors.grey,
                    //                               borderRadius:
                    //                                   BorderRadius.circular(
                    //                                 50,
                    //                               ),
                    //                             ),
                    //                             child: ClipRRect(
                    //                               borderRadius:
                    //                                   BorderRadius.circular(
                    //                                 50,
                    //                               ),
                    //                               child: Image.network(
                    //                                 foodInfo["imageUrl"]
                    //                                     .toString(),
                    //                                 fit: BoxFit.cover,
                    //                               ),
                    //                             ),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     Padding(
                    //                       padding:
                    //                           const EdgeInsets.only(left: 8.0),
                    //                       child: Column(
                    //                         crossAxisAlignment:
                    //                             CrossAxisAlignment.start,
                    //                         children: [
                    //                           Container(
                    //                             padding:
                    //                                 EdgeInsets.only(bottom: 6.0),
                    //                             child: SizedBox(
                    //                               width: MediaQuery.of(context)
                    //                                       .size
                    //                                       .width -
                    //                                   150,
                    //                               child: Row(
                    //                                 children: [
                    //                                   Expanded(
                    //                                     child: Text(
                    //                                       foodInfo["name"]
                    //                                           .toString(),
                    //                                       softWrap: false,
                    //                                       maxLines: 1,
                    //                                       overflow:
                    //                                           TextOverflow.fade,
                    //                                       style: TextStyle(
                    //                                         fontSize: 18,
                    //                                         fontWeight:
                    //                                             FontWeight.w700,
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                   SizedBox(
                    //                                     width: 20,
                    //                                   ),
                    //                                   Container(
                    //                                     width:
                    //                                         MediaQuery.of(context)
                    //                                                 .size
                    //                                                 .width *
                    //                                             0.15,
                    //                                     padding:
                    //                                         EdgeInsets.all(2.0),
                    //                                     decoration: BoxDecoration(
                    //                                       color: Colors.orange,
                    //                                       borderRadius:
                    //                                           BorderRadius
                    //                                               .circular(20),
                    //                                     ),
                    //                                     child: Center(
                    //                                       child: Text(
                    //                                         foodInfo["fat"]
                    //                                             .toString(),
                    //                                         style: TextStyle(
                    //                                           fontSize: 10,
                    //                                           color: Colors.white,
                    //                                           fontWeight:
                    //                                               FontWeight.w100,
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ],
                    //                               ),
                    //                             ),
                    //                           ),
                    //                           Text(
                    //                             foodInfo["carbohydrates"]
                    //                                 .toString(),
                    //                             style: TextStyle(
                    //                               fontSize: 12,
                    //                               color: Colors.black87,
                    //                               fontWeight: FontWeight.w300,
                    //                             ),
                    //                           ),
                    //                           Text(
                    //                             foodInfo["calories"].toString(),
                    //                             style: TextStyle(
                    //                               fontSize: 12,
                    //                               color: Colors.black54,
                    //                               fontWeight: FontWeight.w300,
                    //                             ),
                    //                           ),
                    //                           // Text(
                    //                           //   foodInfo["info"].toString(),
                    //                           //   style: TextStyle(
                    //                           //     fontSize: 12,
                    //                           //     color: Colors.lightBlueAccent,
                    //                           //     fontWeight: FontWeight.w300,
                    //                           //   ),
                    //                           // ),
                    //                         ],
                    //                       ),
                    //                     )
                    //                   ],
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ),
                ),
              //end the loop above
            ],
          ),
        ),
      ),
    );
  }

  Column foodIconInfo(iconInfo, icon, foodTitle) {
    return Column(
      children: [
        Text(
          iconInfo,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        5.heightBox,
        Text(
          foodTitle,
          style: TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  CategoryCard({
    this.onTap,
    this.foodName = "Loading...",
    this.imageUrl =
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmiro.medium.com%2Fmax%2F880%2F0*H3jZONKqRuAAeHnG.jpg&f=1&nofb=1",
  });

  Function? onTap;
  String imageUrl;
  String foodName;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(
                    10,
                  ),
                ),
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                        Color.fromARGB(255, 70, 15, 28).withOpacity(0.7),
                        Colors.transparent
                      ]))),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    // CategoryIcon(
                    //     color: this.category!.color,
                    //     iconName: this.category!.icon),
                    SizedBox(width: 10),
                    Text(foodName,
                        style: TextStyle(color: Colors.white, fontSize: 25))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
