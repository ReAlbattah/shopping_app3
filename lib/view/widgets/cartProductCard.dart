import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app3/logic/controllers/cartController.dart';
import 'package:shopping_app3/model/productModels.dart';
import 'package:shopping_app3/utils/theme.dart';

class CartProductCard extends StatelessWidget {
  CartProductCard(
      {super.key, required this.productModels, required this.index, required this.quantity});
  final ProductModels productModels;
  final int index;
  final int quantity;
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? pinkClr.withOpacity(0.7)
            : mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                  productModels.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModels.title,
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '\$${controller.productSubTotal[index].toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      controller.removeProductToCart(productModels);
                    },
                    icon: Icon(Icons.remove_circle,
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  ),
                  Text(
                    '$quantity',
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.addProductToCart(productModels);
                    },
                    icon: Icon(Icons.add_circle,
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  controller.removeOneProduct(productModels);
                },
                icon: Icon(
                  Icons.delete,
                  color: Get.isDarkMode ? Colors.black : Colors.red,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
