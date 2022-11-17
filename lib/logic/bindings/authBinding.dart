import 'package:get/get.dart';
import 'package:shopping_app3/logic/controllers/authController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
