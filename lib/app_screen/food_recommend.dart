import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodRecommend extends StatefulWidget {
  const FoodRecommend({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FoodRecommendState createState() => _FoodRecommendState();
}

class _FoodRecommendState extends State<FoodRecommend> {
  List<FavoriteFood> favoriteFoods = [];

  List<Food> recommendedFoods1 = [
    Food(name: 'ข้าวมันไก่', image: 'ข้าวมันไก่.jpg'),
    Food(name: 'ข้าวผัดกระเพรา', image: 'ข้าวผัดกะเพรา.jpg'),
    Food(name: 'ข้าวผัดกุ้ง', image: 'ข้าวผัดกุ้ง.jpg'),
    Food(name: 'ข้าวผัดพริกแกง', image: 'ข้าวผัดพริกแกงหมูกรอบ.jpg'),
    Food(name: 'กุ้งทอดกระเทียมพริกไทย', image: 'กุ้งทอดกระเทียมพริกไทย.jpg'),
  ];

  List<Food> recommendedFoods2 = [
    Food(name: 'ข้าวเหนียวมะม่วง', image: 'ข้าวเหนียวมะม่วง.jpg'),
    Food(name: 'ขนมชั้นดอกกุหลาบ', image: 'ขนมชั้นดอกกุหลาบ.jpg'),
    Food(name: 'กล้วยบวชชี', image: 'กล้วยบวชชี.jpg'),
    Food(name: 'บัวลอยไข่หวาน', image: 'บัวลอยไข่หวาน.jpg'),
    Food(name: 'ทับทิมกรอบน้ำกะทิ', image: 'ทับทิมกรอบน้ำกะทิ.jpg'),
  ];

  List<Food> popularFoods = [
    Food(name: 'ผัดซีอิ๊วหมู', image: 'ผัดซีอิ๊ว.jpg'),
    Food(name: 'ข้าวไข่ข้น', image: 'ข้าวไข่ข้น.jpg'),
    Food(
        name: 'บะหมี่กรอบราดหน้ารวมมิตร',
        image: 'บะหมี่กรอบราดหน้ารวมมิตร.jpg'),
    Food(name: 'สุกี้แห้งทะเล', image: 'สุกี้แห้งทะเล.jpg'),
    Food(name: 'ผัดไทยกุ้งสด', image: 'ผัดไทยกุ้งสด.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0ECCF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 40,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '(ไม่รู้)กินอะไรดี',
                      style: GoogleFonts.prompt(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'มีเมนูแนะนำ',
                      style: GoogleFonts.prompt(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(7),
              child: Text(
                'เมนูแนะนำสำหรับคุณ',
                style: GoogleFonts.prompt(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                itemCount: recommendedFoods1.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Image.asset(
                                'images/${recommendedFoods1[index].image}',
                                fit: BoxFit.cover,
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                alignment: Alignment.topRight,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: IconButton(
                                  color: Colors.red,
                                  icon: recommendedFoods1[index].isFavorite
                                      ? const Icon(Icons.favorite_outlined)
                                      : const Icon(
                                          Icons.favorite_border_rounded),
                                  onPressed: () {
                                    setState(() {
                                      recommendedFoods1[index].isFavorite =
                                          !recommendedFoods1[index].isFavorite;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          recommendedFoods1[index].name,
                          style: GoogleFonts.prompt(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                itemCount: recommendedFoods2.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Image.asset(
                                'images/${recommendedFoods2[index].image}',
                                fit: BoxFit.cover,
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                alignment: Alignment.topRight,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: IconButton(
                                  color: Colors.red,
                                  icon: recommendedFoods2[index].isFavorite
                                      ? const Icon(Icons.favorite_outlined)
                                      : const Icon(
                                          Icons.favorite_border_rounded),
                                  onPressed: () {
                                    setState(() {
                                      recommendedFoods2[index].isFavorite =
                                          !recommendedFoods2[index].isFavorite;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          recommendedFoods2[index].name,
                          style: GoogleFonts.prompt(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(7.0),
              child: Text(
                'เมนูยอดนิยม',
                style: GoogleFonts.prompt(
                    fontSize: 20, fontWeight: FontWeight.bold),
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
                          child: Stack(
                            children: [
                              Image.asset(
                                'images/${popularFoods[index].image}',
                                fit: BoxFit.cover,
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                alignment: Alignment.topRight,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: IconButton(
                                  color: Colors.red,
                                  icon: popularFoods[index].isFavorite
                                      ? const Icon(Icons.favorite_outlined)
                                      : const Icon(
                                          Icons.favorite_border_rounded),
                                  onPressed: () {
                                    setState(() {
                                      popularFoods[index].isFavorite =
                                          !popularFoods[index].isFavorite;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          popularFoods[index].name,
                          style: GoogleFonts.prompt(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Food {
  final String name;
  final String image;
  bool isFavorite = false;

  Food({required this.name, required this.image, this.isFavorite = false});
}

class FavoriteFood {
  final String name;
  final String image;

  FavoriteFood({required this.name, required this.image});
}
