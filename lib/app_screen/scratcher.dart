import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';
import 'package:google_fonts/google_fonts.dart';

class ScratcherScreen extends StatelessWidget {
  double _opacity = 0.0;

  final String result;
  ScratcherScreen({required this.result});

  Color background_color = Color(0xffF0ECCF);

  Color button2_color = Colors.black45;
  Color button1_color = Color(0xff7AA874);

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background_color,
        body: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 60)),
            AlertDialog(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              title: Align(
                alignment: Alignment.center,
                child: Text(
                  'ขูดดูสิ',
                  style: GoogleFonts.prompt(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
              content: StatefulBuilder(builder: (context, StateSetter setState) {

                return Scratcher(
                  accuracy: ScratchAccuracy.low,
                  threshold: 15,
                  brushSize: 50,
                  onThreshold: () {
                    setState(() {
                      _opacity = 1;
                    });
                  },
                  image: Image.asset('images/1933833.png', width: 150, height: 150,),
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 250),
                    opacity: _opacity,
                    child: Container(
                      height: 300,
                      width: 300,
                      alignment: Alignment.center,
                      child: Text(
                        result,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: button1_color),
                      ),
                    ),
                  ),
                );
              }
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            SizedBox(
                width: 300,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('เลือกวิธีสุ่มใหม่', style: GoogleFonts.prompt(
                      fontSize: 25, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: button1_color,
                  ),
                )
            ),
            Padding(padding: EdgeInsets.only(top: 25)),
            SizedBox(
                width: 300,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Text('กลับหน้าหลัก', style: GoogleFonts.prompt(fontSize: 25, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: button2_color,
                  ),
                )
            ),
          ],
        )
    );
  }
}