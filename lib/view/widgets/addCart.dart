import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app3/logic/controllers/cartController.dart';
import 'package:shopping_app3/model/productModels.dart';
import 'package:shopping_app3/utils/theme.dart';
import 'package:shopping_app3/view/widgets/textUtils.dart';

class AddCart extends StatelessWidget {
  final double price;
  final ProductModels productModels;
  final controller = Get.find<CartController>();
  AddCart({super.key, required this.price, required this.productModels});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  text: 'Price',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none),
              Text(
                '\$$price',
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                ),
                onPressed: () {
                  controller.addProductToCart(productModels);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        text: 'Add To Cart',
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        underLine: TextDecoration.none),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.shopping_cart_checkout,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
