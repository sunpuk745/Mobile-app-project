import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:mobile_app_project/app_screen/spinwheel2.dart';

class ListViewFood extends StatefulWidget {
  const ListViewFood({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ListViewFoodState createState() => _ListViewFoodState();
}

class _ListViewFoodState extends State<ListViewFood> {
  final List<String> entries = [];
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    entries.sort();

    return Material(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Padding(padding: EdgeInsets.only(top: 15)),
        Text(
          'กินไรดี',
          style: GoogleFonts.prompt(
              fontWeight: FontWeight.bold, fontSize: 50.0, color: Colors.black),
        ),
        Image.network('https://img.freepik.com/free-icon/pizza_318-335738.jpg',
            width: 150, height: 100),
        Container(
          margin: const EdgeInsets.only(
              left: 50.0, top: 10.0, right: 50.0, bottom: 10.0),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black38, blurRadius: 5, offset: Offset(0, 5))
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(
            child: TextField(
              controller: textController,
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: 'พิมพ์ชื่ออาหาร',
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
            ], borderRadius: BorderRadius.circular(30.0), color: Colors.white),
            child: entries.isNotEmpty
                ? Scrollbar(
                    child: ListView.separated(
                    padding: const EdgeInsets.all(10.0),
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
                              color: Colors.red,
                              size: 40,
                            )),
                        title: Text(
                          // ignore: unnecessary_string_interpolations
                          '${entries[index]}',
                          style: const TextStyle(fontSize: 30.0),
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
                      builder: (context) => SpinWheel2(value: entries)));
                } else {
                  //Do nothing //TODO: Can implement something later
                }
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              color: Colors.green,
              child: Text(
                'วันนี้จะกิน...(กดสุ่ม)',
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
            color: Colors.green,
            child: Text(
              'เมนูแนะนํา',
              style: GoogleFonts.prompt(fontSize: 25.0, color: Colors.white),
            ),
          ),
        )
      ],
    ));
  }
}
