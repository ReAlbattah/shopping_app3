import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app3/utils/theme.dart';

import '../../../logic/controllers/settingController.dart';
import '../../../logic/controllers/themeController.dart';
import '../textUtils.dart';

class DarkMode extends StatelessWidget {
  DarkMode({super.key});
  final controller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconWidget(),
          Switch(
            activeTrackColor: Get.isDarkMode ? pinkClr : mainColor,
            activeColor: Get.isDarkMode ? pinkClr : mainColor,
            value: controller.swithchValue.value,
            onChanged: (value) {
              ThemeController().changesTheme();
              controller.swithchValue.value = value;
            },
          ),
        ],
      ),
    );
  }

  Widget iconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child: Icon(
              Icons.dark_mode_rounded,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          TextUtils(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            text: "Dark Mode".tr,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            underLine: TextDecoration.none,
          ),
        ],
      ),
    );
  }
}
