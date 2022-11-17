import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app3/utils/theme.dart';

class SizeList extends StatefulWidget {
  const SizeList({super.key});

  @override
  State<SizeList> createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  final List<String> sizeList = ['S', 'M', 'L', 'XL'];
  var currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentSelected = index;
                  print(currentSelected);
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? currentSelected == index
                          ? pinkClr.withOpacity(0.9)
                          : Colors.black
                      : currentSelected == index
                          ? mainColor.withOpacity(0.9)
                          : Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.4),
                    width: 2,
                  ),
                ),
                child: Text(
                  sizeList[index],
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10,
            );
          },
          itemCount: sizeList.length),
    );
  }
}
