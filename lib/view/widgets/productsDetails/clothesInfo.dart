import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:shopping_app3/logic/controllers/productController.dart';
import 'package:shopping_app3/model/productModels.dart';
import 'package:shopping_app3/utils/theme.dart';
import 'package:shopping_app3/view/widgets/textUtils.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  final String description;
  ClothesInfo(
      {super.key,
      required this.title,
      required this.productId,
      required this.rate,
      required this.description});

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsetsDirectional.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(0.9)
                        : Colors.grey.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.manageFavorites(productId);
                    },
                    child: controller.isFavorite(productId)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                            size: 20,
                          ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextUtils(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  text: '$rate',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none),
              const SizedBox(
                width: 8,
              ),
              const Icon(
                Icons.star,
                size: 15,
                color: Colors.orangeAccent,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ReadMoreText(
            description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            lessStyle: TextStyle(
                color: Get.isDarkMode ? pinkClr : mainColor,
                fontWeight: FontWeight.bold),
            moreStyle: TextStyle(
                color: Get.isDarkMode ? pinkClr : mainColor,
                fontWeight: FontWeight.bold),
            style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
