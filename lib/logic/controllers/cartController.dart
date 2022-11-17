import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app3/model/productModels.dart';
import 'package:shopping_app3/routes/routes.dart';
import 'package:shopping_app3/view/screens/cartScreen.dart';

import '../../utils/theme.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductToCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels)) {
      productsMap[productModels] += 1;
    } else {
      productsMap[productModels] = 1;
    }

    Get.snackbar(
      'Item added to cart',
      '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
      colorText: Colors.white,
    );
  }

  void removeProductToCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels) &&
        productsMap[productModels] == 1) {
      productsMap.removeWhere((key, value) => key == productModels);
    } else {
      productsMap[productModels] -= 1;
    }
  }

  void removeOneProduct(ProductModels productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProduct() {
    Get.defaultDialog(
      title: 'Remove all items',
      titleStyle: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you want to remove all items?',
      middleTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: 'No',
      cancelTextColor: Colors.white,
      textConfirm: 'YES',
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
    );
  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
