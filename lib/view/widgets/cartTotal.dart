import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app3/logic/controllers/cartController.dart';
import 'package:shopping_app3/utils/theme.dart';
import 'package:shopping_app3/view/widgets/textUtils.dart';

class CartTotal extends StatelessWidget {
  final controller = Get.find<CartController>();
  CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            Column(
              children: [
                TextUtils(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    text: 'Total',
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underLine: TextDecoration.none),
                Text(
                  '\$${controller.total}',
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                )
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
                    elevation: 0,
                    primary: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.shopping_bag,
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
    });
  }
}
