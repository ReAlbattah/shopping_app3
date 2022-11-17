import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app3/logic/controllers/productController.dart';
import 'package:shopping_app3/view/widgets/textUtils.dart';

class FavoriteScreen extends StatelessWidget {
  final controller = Get.put(ProductController());

  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(
        () {
          if (controller.favoritesList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/images/heart.png'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'No favorites products',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return buildFavItems(
                    image: controller.favoritesList[index].image,
                    title: controller.favoritesList[index].title,
                    price: controller.favoritesList[index].price,
                    productId: controller.favoritesList[index].id,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ); // خط بين كل عنصر
                },
                itemCount: controller.favoritesList.length);
          }
        },
      ),
    );
  }

  Widget buildFavItems({
    required String image,
    required String title,
    required double price,
    required int productId,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$title',
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$ $price',
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                controller.manageFavorites(productId);
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
