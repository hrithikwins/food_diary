import 'package:get/get.dart';

import '../modules/home/add_product/bindings/add_product.binding.dart';
import '../modules/home/add_product/views/add_product.view.dart';
import '../modules/home/bindings/home.binding.dart';
import '../modules/home/views/home.view.dart';

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
          name: _Paths.ADD_PRODUCT,
          page: () => AddProductView(),
          binding: AddProductBinding(),
        ),
      ],
    ),
  ];
}
