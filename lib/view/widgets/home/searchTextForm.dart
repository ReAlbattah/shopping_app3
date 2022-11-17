import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app3/logic/controllers/productController.dart';

class SearchTextForm extends StatelessWidget {
  SearchTextForm({super.key});

  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (_) {
      return TextField(
        controller: controller.searchTextController,
        onChanged: (textSearch) {
          controller.addSearchToList(textSearch);
        },
        cursorColor: Colors.black,
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.red,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: controller.searchTextController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    controller.clearSearch();
                  },
                  icon: Icon(
                    Icons.close_rounded,
                    color: Colors.black,
                  ),
                )
              : null,
          hintText: 'Search with name',
          hintStyle: TextStyle(
              color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    });
  }
}
