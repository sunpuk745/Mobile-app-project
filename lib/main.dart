import 'package:flutter/material.dart';
import 'package:mobile_app_project/app_screen/calculator_page.dart';
import 'app_screen/home_page.dart';
import 'app_screen/ginraidee.dart';
import 'app_screen/food_recommend.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/eat': (context) => const ListViewFood(),
        '/calculate': (context) => Calculator(),
        '/foodRecommend': (context) => const FoodRecommend(),
      },
    );
  }
}
