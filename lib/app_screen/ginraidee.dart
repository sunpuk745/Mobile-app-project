import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:mobile_app_project/app_screen/spinwheel2.dart';
import 'package:mobile_app_project/app_screen/scratcher.dart';

class ListViewFood extends StatefulWidget {
  const ListViewFood({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ListViewFoodState createState() => _ListViewFoodState();
}

class _ListViewFoodState extends State<ListViewFood> {
  final List<String> entries = ['ส้มตำ', 'ไก่ทอด'];
  final textController = TextEditingController();

  Color background_color = Color(0xffF0ECCF);
  Color req_button_color = Color(0xff7AA874);
  Color continue_button_color = Color(0xff7AA874);
  Color back_button_color = Colors.black45;

  Color result_text_color = Color(0xff7AA874);
  Color title_text_color = Colors.black;

  @override
  Widget build(BuildContext context) {
    entries.sort();

    return Material(
        color: background_color,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Padding(padding: EdgeInsets.only(top: 5)),
          Text(
            'กินอะไรดี',
            style: GoogleFonts.prompt(
                fontWeight: FontWeight.bold, fontSize: 50.0, color: title_text_color),
          ),
          Container(
            margin: const EdgeInsets.only(
                left: 50.0, top: 10.0, right: 50.0, bottom: 10.0),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black38, blurRadius: 5, offset: Offset(0, 5))
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: TextField(
                controller: textController,
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'เพิ่มเมนูตรงนี้',
                    hintStyle: GoogleFonts.prompt(),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          if (textController.text.isNotEmpty) {
                            entries.add(textController.text);
                            textController.clear();
                          } else {
                            //do nothing
                          }
                        });
                      },
                      icon: const Icon(Icons.add, size: 30),
                    )),
              ),
            ),
          ),
          Text(
            'ปล. โปรดเพิ่มรายการอย่างน้อย 2 รายการ',
            style:
                GoogleFonts.prompt(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          Container(
              margin: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
              ),
              height: 200.0,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                    color: Colors.black38, blurRadius: 5, offset: Offset(0, 5))
              ], borderRadius: BorderRadius.circular(10.0), color: Colors.white),
              child: entries.isNotEmpty
                  ? Scrollbar(
                      child: ListView.separated(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      itemCount: entries.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: IconButton(
                              onPressed: () {
                                setState(() {
                                  entries.removeAt(index);
                                });
                              },
                              icon: const Icon(
                                Icons.remove_circle,
                                color: Colors.redAccent,
                                size: 30,
                              )),
                          title: Text(
                            // ignore: unnecessary_string_interpolations
                            '${entries[index]}',
                            style: GoogleFonts.prompt(fontSize: 24.0),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                        color: Colors.black26,
                      ),
                    ))
                  : Center(
                      child: Text(
                        'No food in your list',
                        style: GoogleFonts.prompt(
                            fontSize: 30, color: Colors.black26),
                      ),
                    )),
          Visibility(
            visible: entries.length >= 2,
            child: SizedBox(
              width: 300,
              height: 60,
              child: MaterialButton(
                onPressed: () {
                  if (entries.isNotEmpty) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SelectScreen(entries: entries)));
                  } else {
                    //Do nothing //TODO: Can implement something later
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                color: continue_button_color,
                child: Text(
                  'สุ่มเลย',
                  style: GoogleFonts.prompt(fontSize: 25.0, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 300,
            height: 60,
            child: MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/foodRecommend');
              },
              // ignore: unnecessary_new
              shape: new RoundedRectangleBorder(
                  // ignore: unnecessary_new
                  borderRadius: new BorderRadius.circular(30.0)),
              color: req_button_color,
              child: Text(
                'เมนูแนะนํา',
                style: GoogleFonts.prompt(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            width: 300,
            height: 60,
            child: MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              // ignore: unnecessary_new
              shape: new RoundedRectangleBorder(
                // ignore: unnecessary_new
                  borderRadius: new BorderRadius.circular(30.0)),
              color: back_button_color,
              child: Text(
                'กลับ',
                style: GoogleFonts.prompt(fontSize: 25.0, color: Colors.white),
              ),
            ),
          )
        ],
      )
    );
  }
}

class SelectScreen extends StatelessWidget {
  List<String> entries = [];

  //test color
  Color background_color = Color(0xffF0ECCF);
  Color button2_color = Colors.black45;
  Color button1_color = Color(0xff7AA874);

  Color result_text_color = Color(0xff7AA874);
  Color title_text_color = Colors.black;

  SelectScreen({required this.entries});
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: 5)),
                Text(
                  'กินอะไรดี',
                  style: GoogleFonts.prompt(
                      fontWeight: FontWeight.bold, fontSize: 50.0, color: title_text_color),
                ),
                Text(
                  'เลือกวิธีเลย!',
                  style: GoogleFonts.prompt(
                      fontWeight: FontWeight.bold, fontSize: 50.0, color: title_text_color),
                ),
                Padding(padding: EdgeInsets.only(top: 55)),
                SizedBox(
                    width: 300,
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        if (entries.isNotEmpty) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SpinWheel2(value: entries)));
                        } else {
                          //Do nothing //TODO: Can implement something later
                        }
                      },
                      child: Text('กงล้อหมุน',
                          style: GoogleFonts.prompt(
                              fontSize: 24,
                              color: Colors.white)),
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
                        if (entries.isNotEmpty) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ScratcherScreen(result: entries[random.nextInt(entries.length)])));
                        } else {
                          //Do nothing //TODO: Can implement something later
                        }
                      },
                      child: Text('ขูดหวย',
                          style: GoogleFonts.prompt(
                              fontSize: 24,
                              color: Colors.white)),
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
                        Navigator.pop(context);
                      },
                      child: Text('กลับ',
                          style: GoogleFonts.prompt(
                              fontSize: 24,
                              color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: button2_color,
                      ),
                    )
                ),
              ])
      ),
    );
  }
}
