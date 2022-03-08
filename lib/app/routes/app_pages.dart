import 'package:get/get.dart';

import '../modules/home/add_food_entry/add_food_entry.binding.dart';
import '../modules/home/add_food_entry/add_food_entry.view.dart';
import '../modules/home/food_details/food_details.binding.dart';
import '../modules/home/food_details/food_details.view.dart';
import '../modules/home/home.binding.dart';
import '../modules/home/home.view.dart';
import '../modules/login/login.binding.dart';
import '../modules/login/login.view.dart';
import '../modules/splash/splash.binding.dart';
import '../modules/splash/splash.view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.ADD_FOOD_ENTRY,
          page: () => AddFoodEntryView(),
          binding: AddFoodEntryBinding(),
        ),
        GetPage(
          name: _Paths.FOOD_DETAILS,
          page: () => FoodDetailsView(),
          binding: FoodDetailsBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
