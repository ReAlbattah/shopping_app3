import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app3/routes/routes.dart';
import 'package:shopping_app3/utils/theme.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 150,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          SizedBox(
            height: 40,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Your cart is ',
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'empty ',
                  style: TextStyle(
                      color: Get.isDarkMode ? pinkClr : mainColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Add items to get started',
            style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),

          const SizedBox(height: 50,),

          SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
                primary: Get.isDarkMode ? pinkClr : mainColor,
              ),
              onPressed: () {
                Get.toNamed(Routes.mainScreen);
              },
              child: Text('Go to Home ',
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 20,
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
