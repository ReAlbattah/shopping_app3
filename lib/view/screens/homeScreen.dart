import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app3/utils/theme.dart';
import 'package:shopping_app3/view/widgets/textUtils.dart';

import '../widgets/home/cardItems.dart';
import '../widgets/home/searchTextForm.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? pinkClr : mainColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      text: 'Find your',
                      color: Colors.white,
                      underLine: TextDecoration.none),
                  const SizedBox(
                    height: 5,
                  ),
                  TextUtils(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      text: 'INSPIRATION',
                      color: Colors.white,
                      underLine: TextDecoration.none),
                  const SizedBox(
                    height: 20,
                  ),
                  SearchTextForm(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  text: 'Categories',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CardItems(),
        ],
      ),
    );
  }
}
