import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app3/model/productModels.dart';

import '../widgets/addCart.dart';
import '../widgets/productsDetails/clothesInfo.dart';
import '../widgets/productsDetails/imageSliders.dart';
import '../widgets/sizeList.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;
  const ProductDetailsScreen({super.key, required this.productModels});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSliders(
              imageUrl: productModels.image,
            ),
            ClothesInfo(
              title: productModels.title,
              productId: productModels.id,
              rate: productModels.rating.rate,
              description: productModels.description,
            ),
            const SizeList(),
            AddCart(
              price: productModels.price,
              productModels: productModels,
            ),
          ],
        ),
      ),
    );
  }
}
