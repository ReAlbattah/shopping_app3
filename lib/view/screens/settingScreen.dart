import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app3/logic/controllers/authController.dart';
import 'package:shopping_app3/logic/controllers/themeController.dart';
import 'package:shopping_app3/utils/theme.dart';
import 'package:shopping_app3/view/widgets/setting/logOut.dart';

import '../widgets/setting/darkMode.dart';
import '../widgets/setting/language.dart';
import '../widgets/textUtils.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const SizedBox(
            height: 20,
          ),
          TextUtils(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            text: "GENERAL".tr,
            color: Get.isDarkMode ? pinkClr : mainColor,
            underLine: TextDecoration.none,
          ),
          const SizedBox(
            height: 20,
          ),
          DarkMode(),
          const SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          const SizedBox(
            height: 20,
          ),
          LogOut(),
        ],
      ),
    );
  }
}
