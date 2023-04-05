import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

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
                          color: i % 2 == 0 ? Colors.green : Colors.blue, // <-- Set color based on odd/even
                          borderColor: Colors.white, // <-- Wheel border color
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
                        color: Colors.yellow, // <-- Pointer color
                      ))
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 50)),
            GestureDetector(
              onTap: () {
                setState(() {
                  selected.add(Fortune.randomInt(0, value.length));
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
            Text("วันนี้ไปกินนน!!",
              style: TextStyle(fontSize: 36),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            Text(result,
              style: TextStyle(fontSize: 36),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Again'),
                ),
                Padding(padding: EdgeInsets.only(right: 50)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Home'),
                )
              ],
            )
        ])
      ),
    );
  }
}