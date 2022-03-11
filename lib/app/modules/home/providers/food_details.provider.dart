import 'package:get/get.dart';

import '../food_details.model.dart';

class FoodDetailsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return FoodDetails.fromJson(map);
      if (map is List)
        return map.map((item) => FoodDetails.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<FoodDetails?> getFoodDetails(int id) async {
    final response = await get('fooddetails/$id');
    return response.body;
  }

  Future<Response<FoodDetails>> postFoodDetails(
          FoodDetails fooddetails) async =>
      await post('fooddetails', fooddetails);
  Future<Response> deleteFoodDetails(int id) async =>
      await delete('fooddetails/$id');
}
