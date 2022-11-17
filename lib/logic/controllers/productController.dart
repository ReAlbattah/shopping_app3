import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopping_app3/services/productServices.dart';

import '../../model/productModels.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var favoritesList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var storage = GetStorage();
  var searchList = <ProductModels>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    List? storageFav = storage.read<List>('isFav');

    if (storageFav != null) {
      favoritesList =
          storageFav.map((e) => ProductModels.fromJson(e)).toList().obs;
    }

    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();

    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void manageFavorites(int productId) async {
    var removeIndex =
        favoritesList.indexWhere((element) => element.id == productId);

    if (removeIndex >= 0) {
      favoritesList.removeAt(removeIndex);
      await storage.remove('isFav');
    } else {
      favoritesList
          .add(productList.firstWhere((element) => element.id == productId));

      await storage.write('isFav', favoritesList);
    }
  }

  bool isFavorite(int productId) {
    return favoritesList.any((element) => element.id == productId);
  }

  void addSearchToList(String textSearch) {
    textSearch = textSearch.toLowerCase();

    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      return searchTitle.contains(textSearch);
    }).toList();

    update();
  }

  void clearSearch() {
    searchTextController.clear();
  }
}
