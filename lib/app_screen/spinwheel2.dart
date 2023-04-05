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

  //original color
/*  Color background_color = Colors.white;
  Color title_color = Colors.black;

  Color spinwheel_border_color = Colors.white;
  Color odd_spinwheel_color = Colors.green;
  Color even_spinwheel_color = Colors.greenAccent;
  Color special_spinwheel_color = Colors.black54;

  Color back_button_color = Colors.redAccent;
  Color spin_button_color = Colors.green;*/

  //test color
/*  Color background_color = Color(0xffABC4AA);
  Color title_color = Colors.black;

  Color spinwheel_border_color = Colors.white;
  Color odd_spinwheel_color = Color(0xffF3DEBA);
  Color even_spinwheel_color = Color(0xffA9907E);
  Color special_spinwheel_color = Colors.black54;

  Color back_button_color = Color(0xffA9907E);
  Color spin_button_color = Color(0xff675D50);*/

  Color background_color = Color(0xffF0ECCF);
  Color title_color = Colors.black;

  Color spinwheel_border_color = Colors.white;
  Color odd_spinwheel_color = Color(0xffFBC252);
  Color even_spinwheel_color = Color(0xff7AA874);
  Color special_spinwheel_color = Colors.black54;

  Color back_button_color = Colors.black45;
  Color spin_button_color = Color(0xff7AA874);

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
            Text('กินอะไรดี',
              style: GoogleFonts.prompt(
                  fontWeight: FontWeight.bold, fontSize: 50.0, color: title_color),
            ),
            Padding(padding: EdgeInsets.only(top: 50)),
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
                        child: Text('  ' + value[i],
                            style: GoogleFonts.prompt(
                                fontSize: 25,
                            )),
                        style: FortuneItemStyle(
                          color: i % 2 == 1 ? odd_spinwheel_color : (i == 0 ? special_spinwheel_color : even_spinwheel_color), // <-- Set color based on odd/even
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
            Padding(padding: EdgeInsets.only(top: 30)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 300,
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selected.add(Fortune.randomInt(0, value.length));
                        });
                      },
                      child: Text('สุ่มเลย',
                          style: GoogleFonts.prompt(
                              fontSize: 24,
                              color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: spin_button_color,
                      ),
                    )
                ),
                Padding(padding: EdgeInsets.only(top: 25)),
                SizedBox(
                    width: 300,
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('กลับ',
                          style: GoogleFonts.prompt(
                              fontSize: 24,
                              color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: back_button_color,
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

  //test color
  Color background_color = Color(0xffF0ECCF);
  Color back_button_color = Colors.black45;
  Color home_button_color = Color(0xff7AA874);

  Color result_text_color = Color(0xff7AA874);
  Color title_text_color = Colors.black;

  ResultScreen({required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              child: Image.asset('images/1933833.png',
                  width: 150, height: 100),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text("วันนี้ไปกินนน!!",
              style: GoogleFonts.prompt(
                  fontSize: 36,
                  color: title_text_color,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(result,
              style: GoogleFonts.prompt(
                  fontSize: 48,
                  color: result_text_color,
                  fontWeight: FontWeight.bold,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 50)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 300,
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('ไม่เอาอ่ะ สุ่มใหม่', style: GoogleFonts.prompt(
                          fontSize: 25, color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                        backgroundColor: home_button_color,
                      ),
                    )
                ),
                Padding(padding: EdgeInsets.only(top: 30)),
                SizedBox(
                  width: 300,
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text('กลับหน้าหลัก', style: GoogleFonts.prompt(fontSize: 25, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: back_button_color,
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