import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:shopping_app3/logic/controllers/mainController.dart';

import '../controllers/settingController.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
  }
}
