import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app3/view/screens/categoryScreen.dart';
import 'package:shopping_app3/view/screens/favritesScreen.dart';
import 'package:shopping_app3/view/screens/homeScreen.dart';
import 'package:shopping_app3/view/screens/settingScreen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ].obs;

  final title = [
    'Online Shop',
    'Category',
    'favorite',
    'Setting',
  ].obs;
}
