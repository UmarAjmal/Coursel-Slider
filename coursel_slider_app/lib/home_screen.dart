import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final List<String> images = [
    'image/IMG-20240912-WA0015.jpg',
    'image/IMG-20240912-WA0016.jpg',
    'image/IMG-20240912-WA0017.jpg',
    'image/IMG-20240912-WA0018.jpg',
    'image/IMG-20240912-WA0019.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page '),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (context, index, realIdx) {
              return Image.asset(images[index], fit: BoxFit.cover);
            },
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              aspectRatio: 16 / 9,
              enlargeCenterPage: true,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ElevatedButton(
                  onPressed: () => Get.toNamed('/full-screen-slider'),
                  child: Text('Full Screen Slider'),
                ),
                ElevatedButton(
                  onPressed: () => Get.toNamed('/simple-slider'),
                  child: Text('Simple Slider'),
                ),
                ElevatedButton(
                  onPressed: () => Get.toNamed('/focus-slider'),
                  child: Text('Focus Slider'),
                ),
                ElevatedButton(
                  onPressed: () => Get.toNamed('/vertical-slider'),
                  child: Text('Vertical Slider'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
