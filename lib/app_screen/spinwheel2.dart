import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:google_fonts/google_fonts.dart';

class SpinWheel2 extends StatefulWidget {

  List value;
  SpinWheel2({Key ?key, required this.value}) : super(key: key);

  @override
  State<SpinWheel2> createState() => _SpinWheel2State(value);
}

class _SpinWheel2State extends State<SpinWheel2> {
  StreamController<int> selected = StreamController.broadcast();

  List value;
  _SpinWheel2State(this.value);

  final _random = Random();
  var result = '';

  //test color
  Color background_color = Color(0xffABC4AA);
  Color odd_spinwheel_color = Color(0xffF3DEBA);
  Color even_spinwheel_color = Color(0xffA9907E);
  Color back_button_color = Color(0xffA9907E);
  Color spin_button_color = Color(0xff675D50);
  Color spinwheel_border_color = Colors.white;

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: selected.stream,
              builder: (context, snapshot) => snapshot.hasData
                  ? _text(snapshot)
                  : Container(),
            ),
            SizedBox(
              height: 300,
              child: FortuneWheel(
                selected: selected.stream,
                animateFirst: false,
                physics: CircularPanPhysics(
                  duration: Duration(seconds: 1),
                  curve: Curves.decelerate,
                ),
                onFling: () {
                  selected.add(Fortune.randomInt(0, value.length));
                },
                onAnimationStart: () {
                },
                items: [
                  for (int i = 0; i < value.length; i++)...<FortuneItem>[
                    FortuneItem(
                        child: Text(value[i],
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        style: FortuneItemStyle(
                          color: i % 2 == 0 ? odd_spinwheel_color : even_spinwheel_color, // <-- Set color based on odd/even
                          borderColor: spinwheel_border_color, // <-- Wheel border color
                          borderWidth: 3, // <-- Wheel border width
                        )
                    )
                  ]
                ],
                onAnimationEnd: () {
                  setState(() {
                    StreamBuilder(
                      stream: selected.stream,
                      builder: (context, snapshot) => snapshot.hasData
                          ? _text(snapshot)
                          : Container(),
                    );
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('วันนี้เราจะไปกิน!!! ${result}'))
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        result: result,
                      ),
                    ),
                  );
                },
                indicators: const <FortuneIndicator>[
                  FortuneIndicator(
                      alignment: Alignment.topCenter, // <-- Pointer location
                      child: TriangleIndicator(
                        color: Color(0xff675D50), // <-- Pointer color
                      ))
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('ย้อนกลับ',
                          style: GoogleFonts.prompt(
                              fontSize: 18,
                              color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: back_button_color,
                      ),
                    )
                ),
                Padding(padding: EdgeInsets.only(right: 50)),
                SizedBox(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selected.add(Fortune.randomInt(0, value.length));
                        });
                      },
                      child: Text('สุ่มเลย',
                          style: GoogleFonts.prompt(
                              fontSize: 18,
                              color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: spin_button_color,
                      ),
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _text(var snapshot) {
    int val = snapshot.data;
    result = value[val];

    return SizedBox();
  }
}

class ResultScreen extends StatelessWidget {
  final String result;

  ResultScreen({required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              child: Image.asset('images/icons8-noodles-96.png'),
            ),
            Text("วันนี้ไปกินนน!!",
              style: GoogleFonts.prompt(fontSize: 30),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            Text(result,
              style: GoogleFonts.prompt(fontSize: 42, color: Colors.green, fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('สุ่มใหม่', style: GoogleFonts.prompt(fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    )
                ),
                Padding(padding: EdgeInsets.only(right: 50)),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text('หน้าหลัก', style: GoogleFonts.prompt(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                    ),
                  )
                ),
              ],
            )
        ])
      ),
    );
  }
}