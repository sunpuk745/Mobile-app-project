import 'package:flutter/material.dart';

class FoodRecommendApp extends StatelessWidget {
  const FoodRecommendApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Food> recommendedFoods1 = [
      Food(name: 'ffdffd', image: '1.jpg'),
      Food(name: 'ffdffd', image: '1.jpg'),
      Food(name: 'ffdffd', image: '1.jpg'),
      Food(name: 'ffdffd', image: '1.jpg'),
      Food(name: 'ffdffd', image: '1.jpg'),
    ];

    List<Food> recommendedFoods2 = [
      Food(name: 'ffdffd', image: '1.jpg'),
      Food(name: 'ffdffd', image: '1.jpg'),
      Food(name: 'ffdffd', image: '1.jpg'),
      Food(name: 'ffdffd', image: '1.jpg'),
      Food(name: 'ffdffd', image: '1.jpg'),
    ];

    List<Food> popularFoods = [
      Food(name: 'ffdffd', image: '1.jpg'),
      Food(name: 'ffdffd', image: '1.jpg'),
      Food(name: 'ffdffd', image: '1.jpg'),
      Food(name: 'ffdffd', image: '1.jpg'),
      Food(name: 'ffdffd', image: '1.jpg'),
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '(ไม่รู้)กินอะไรดี',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'มีเมนูแนะนำ',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Food Recommendations',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 90,
            child: ListView.builder(
              itemCount: recommendedFoods1.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'images/${recommendedFoods1[index].image}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        recommendedFoods1[index].name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 90,
            child: ListView.builder(
              itemCount: recommendedFoods2.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'images/${recommendedFoods2[index].image}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        recommendedFoods2[index].name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Popular Food',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: popularFoods.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'images/${popularFoods[index].image}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        popularFoods[index].name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 50,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/eat');
                },
                child: const Text('กลับไปสุ่ม'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Food {
  final String name;
  final String image;

  Food({required this.name, required this.image});
}
