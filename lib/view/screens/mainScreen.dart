// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app3/logic/controllers/mainController.dart';
import 'package:shopping_app3/routes/routes.dart';
import 'package:shopping_app3/utils/theme.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            title: Text(controller.title[controller.currentIndex.value]),
            centerTitle: true,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  Get.toNamed(Routes.cartScreen);
                },
                icon: Image.asset('assets/images/shop.png'),
              ),
            ],
            backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                label: '',
              ),
            ],
            onTap: (index) {
              controller.currentIndex.value = index;
            },
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.tabs.value,
          ),
        );
      }),
    );
  }
}
