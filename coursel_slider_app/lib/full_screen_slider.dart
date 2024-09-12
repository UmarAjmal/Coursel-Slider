import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/StateController.dart';
import 'fade_transition.dart';

// Dummy images list for demonstration; replace with actual image paths
final List<String> imagesUrl = [
  'image/1.jpg',
  'image/2.jpg',
  'image/3.jpg',
  'image/4.jpg',
  'image/5.jpg',
];

// FullScreenSlider with transition
class FullScreenSlider extends StatelessWidget {
  FullScreenSlider({Key? key}) : super(key: key);
  final _stateController = Get.put(StateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Obx(() {
        return FadeTransAnimation(
          duration: 1000,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imagesUrl[_stateController.currentIndexFull.value]),
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Center(
                child: CarouselSlider.builder(
                  itemCount: imagesUrl.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = imagesUrl[index];
                    return buildImage(urlImage, index);
                  },
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enableInfiniteScroll: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    onPageChanged: (index, reason) {
                      _stateController.currentIndexFull.value = index;
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildImage(String urlImage, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Image.asset(
        urlImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
