import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app3/logic/controllers/cartController.dart';
import 'package:shopping_app3/utils/theme.dart';

import '../widgets/cartProductCard.dart';
import '../widgets/cartTotal.dart';
import '../widgets/emptyCart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Cart items',
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
        actions: [
          IconButton(
            onPressed: () {
              controller.clearAllProduct();
            },
            icon: Icon(Icons.backspace),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.productsMap.isEmpty) {
          return EmptyCart();
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 600,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CartProductCard(
                          quantity:
                              controller.productsMap.values.toList()[index],
                          index: index,
                          productModels:
                              controller.productsMap.keys.toList()[index],
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: controller.productsMap.length),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: CartTotal(),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
