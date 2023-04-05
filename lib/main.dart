import 'package:flutter/material.dart';
import 'app_screen/home_page.dart';
import 'app_screen/ginraidee.dart';
import 'app_screen/food_recommend.dart';
import 'app_screen/scratcher.dart';

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
        '/calculate': (context) => const CalculatePage(),
        '/foodRecommend': (context) => const FoodRecommendApp(),
      },
    );
  }
}

class CalculatePage extends StatelessWidget {
  const CalculatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'หารค่าอาหาร',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
