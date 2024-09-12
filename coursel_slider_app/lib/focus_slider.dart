import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Dummy images list for demonstration; replace with actual image paths
final List<String> imagesUrl = [
  'image/1.jpg',
  'image/2.jpg',
  'image/3.jpg',
  'image/4.jpg',
  'image/5.jpg',
];

// StateController for managing state
class StateController extends GetxController {
  var currentIndexFull = 0.obs;
}

// FocusSlider with state management and transition
class FocusSlider extends StatelessWidget {
  FocusSlider({Key? key}) : super(key: key);
  final _stateController = Get.put(StateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Obx(() {
          return Text(
            'Image ${_stateController.currentIndexFull.value + 1}', // +1 for 1-based index
            style: TextStyle(color: Colors.white),
          );
        }),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: CarouselSlider.builder(
          itemCount: imagesUrl.length,
          itemBuilder: (context, index, realIndex) {
            final urlImage = imagesUrl[index];
            return buildImage(urlImage, index);
          },
          options: CarouselOptions(
            height: 400,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              _stateController.currentIndexFull.value = index;
            },
          ),
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: InteractiveViewer(
        maxScale: 8,
        panEnabled: true,
        clipBehavior: Clip.none,
        child: Image.asset(
          urlImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
