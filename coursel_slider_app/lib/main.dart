import 'package:coursel_slider_app/simple_slider.dart';
import 'package:coursel_slider_app/vertical_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'focus_slider.dart';
import 'full_screen_slider.dart';
import 'home_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slider App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/full-screen-slider', page: () => FullScreenSlider()),
        GetPage(name: '/simple-slider', page: () => SimpleSlider()),
        GetPage(name: '/focus-slider', page: () => FocusSlider()),
        GetPage(name: '/vertical-slider', page: () => VerticalSlider()),
      ],
    );
  }
}
