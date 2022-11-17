import 'package:get/get.dart';
import 'package:shopping_app3/logic/controllers/categoryController.dart';
import 'package:shopping_app3/logic/controllers/productController.dart';

import '../controllers/cartController.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }
}
