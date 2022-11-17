import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app3/utils/theme.dart';
import 'package:shopping_app3/view/widgets/productsDetails/colorPicker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSliders extends StatefulWidget {
  final String imageUrl;
  const ImageSliders({super.key, required this.imageUrl});

  @override
  State<ImageSliders> createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  CarouselController carouselController = CarouselController();
  int currentColor = 0;
  int currentPage = 0;
  final List<Color> colorSelected = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60),
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: 3,
            carouselController: carouselController,
            options: CarouselOptions(
              height: 500,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 2),
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
            itemBuilder: (context, index, realIndex) {
              return Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 180,
            child: AnimatedSmoothIndicator(
              activeIndex: currentPage,
              count: 3,
              effect: ExpandingDotsEffect(
                dotWidth: 10,
                dotHeight: 10,
                activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
                dotColor: Colors.black,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 30,
            child: Container(
              height: 200,
              width: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentColor = index;
                        });
                      },
                      child: ColorPicker(
                          color: colorSelected[index],
                          outerBorder: currentColor == index),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 3,
                      ),
                  itemCount: colorSelected.length),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? pinkClr.withOpacity(0.8)
                          : mainColor.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                        4,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
