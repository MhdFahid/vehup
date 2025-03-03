import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/splash_view.dart';

//testing
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
