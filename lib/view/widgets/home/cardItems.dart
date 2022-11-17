import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app3/logic/controllers/cartController.dart';
import 'package:shopping_app3/logic/controllers/productController.dart';
import 'package:shopping_app3/model/productModels.dart';
import 'package:shopping_app3/utils/theme.dart';
import 'package:shopping_app3/view/screens/productDetailsScreen.dart';
import 'package:shopping_app3/view/widgets/textUtils.dart';

class CardItems extends StatelessWidget {
  CardItems({super.key});

  final controller = Get.find<ProductController>();

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Expanded(
          child: controller.searchList.isEmpty &&
                  controller.searchTextController.text.isNotEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_off_sharp,
                      size: 90,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    TextUtils(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        text: 'No Result Found',
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        underLine: TextDecoration.none)
                  ],
                )
              : GridView.builder(
                  itemCount: controller.searchList.isEmpty
                      ? controller.productList.length
                      : controller.searchList.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 9.0,
                    crossAxisSpacing: 6.0,
                    maxCrossAxisExtent: 300,
                  ),
                  itemBuilder: (context, index) {
                    if (controller.searchList.isEmpty) {
                      return buildCardItems(
                          image: controller.productList[index].image,
                          price: controller.productList[index].price,
                          rate: controller.productList[index].rating.rate,
                          productId: controller.productList[index].id,
                          productModels: controller.productList[index],
                          onTap: () {
                            Get.to(() => ProductDetailsScreen(
                                  productModels: controller.productList[index],
                                ));
                          });
                    } else {
                      return buildCardItems(
                          image: controller.searchList[index].image,
                          price: controller.searchList[index].price,
                          rate: controller.searchList[index].rating.rate,
                          productId: controller.searchList[index].id,
                          productModels: controller.searchList[index],
                          onTap: () {
                            Get.to(() => ProductDetailsScreen(
                                  productModels: controller.searchList[index],
                                ));
                          });
                    }
                  },
                ),
        );
      }
    });
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductModels productModels,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0,
                )
              ]),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.manageFavorites(productId);
                      },
                      icon: controller.isFavorite(productId)
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addProductToCart(productModels);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(19),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$$price ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? pinkClr : mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 3, right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                text: '$rate',
                                color: Colors.white,
                                underLine: TextDecoration.none),
                            const Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
