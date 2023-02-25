import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'ginraidee.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class SpinWheel2 extends StatefulWidget {
const SpinWheel2({Key? key}) : super(key: key);

@override
State<SpinWheel2> createState() => _SpinWheel2State();
}

class _SpinWheel2State extends State<SpinWheel2> {
  StreamController<int> selected = StreamController.broadcast();

  final _random = Random();
  var result = '';

  final item = <String>[
    "ขาหมู", "กระเพา", "ก๋วยเตี๋ยว", "ผัดไทย"
  ];

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              child: FortuneWheel(
                animateFirst: false,
                physics: CircularPanPhysics(
                  duration: Duration(seconds: 2),
                  curve: Curves.bounceInOut,
                ),
                items: [
                  for (var items in item)
                    FortuneItem(
                        child: Text(items,
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        style: FortuneItemStyle(
                          color: Colors.primaries[_random.nextInt(Colors.primaries.length)],// <-- Wheel color
                          borderColor: Colors.white, // <-- Wheel border color
                          borderWidth: 3, // <-- Wheel border width
                        )
                    )
                ],
                onAnimationEnd: () {
                  StreamBuilder(
                    stream: selected.stream,
                    builder: (context, snapshot) => snapshot.hasData
                        ? _text(snapshot)
                        : Container(),
                  );
                },
                selected: selected.stream,
                indicators: const <FortuneIndicator>[
                  FortuneIndicator(
                      alignment: Alignment.topCenter, // <-- Pointer location
                      child: TriangleIndicator(
                        color: Colors.yellow, // <-- Pointer color
                      ))
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 50)),
            GestureDetector(
              onTap: () {
                setState(() {
                  selected.add(Fortune.randomInt(0, item.length));
                });
              },
              child: Container(
                height: 80,
                width: 200,
                color: Colors.yellow,
                child: Center(
                  child: Text("หมุน",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      )
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _text(var snapshot) {
    int val = snapshot.data;
    print(item[val]);

    return Text(item[val].toString());
  }
}