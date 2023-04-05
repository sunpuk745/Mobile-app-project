import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_project/app_screen/check_bill.dart';

class Calculator extends StatefulWidget {
  Calculator({Key? key}) : super(key: key);

  @override
  _Calculator createState() => _Calculator();
}

class _Calculator extends State<Calculator> {
  int _people_num = 0;
  TextEditingController _controller = TextEditingController();
  String num = '';
  int _total_cost = 0;
  int _divided_cost = 0;
  final List<TextEditingController> _controllers = [];

  void _initializeControllers() {
    _controllers.clear();
    for (int i = 0; i < _people_num; i++) {
      _controllers.add(TextEditingController());
    }
  }

  void _convertStringtoInt() {
    if (_controller.text.isNotEmpty) {
      _total_cost = int.parse(_controller.text);
    }
  }

  void _divideCost() {
    _divided_cost = (_total_cost / _people_num).round();
  }

  void _incrementPeople() {
    setState(() {
      _people_num++;
      _initializeControllers();
    });
  }

  void _decrementPeople() {
    setState(() {
      if (_people_num == 0) {
        _people_num = 0;
      } else {
        _people_num--;
      }
      _initializeControllers();
    });
  }

  void _handlePress(String value) {
    if (value == '0' && (_controller.text.isEmpty || _controller.text == '0')) {
    } else {
      _controller.text = _controller.text + value;
    }
  }

  void _onBackSpace() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _controller.text =
            _controller.text.substring(0, _controller.text.length - 1);
      }
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'ใครมากินบ้าง?',
          style: GoogleFonts.prompt(color: Colors.black),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < _people_num; i++)
                TextField(
                  controller: _controllers[i],
                  decoration: InputDecoration(
                      labelText: 'คนที่ ${i + 1}',
                      labelStyle: GoogleFonts.prompt(color: Colors.black)),
                ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'ยกเลิก',
              style: GoogleFonts.prompt(color: Colors.grey),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              List<String> inputValues = [];
              for (int i = 0; i < _people_num; i++) {
                inputValues.add(_controllers[i].text);
              }
              Navigator.of(context).pop(inputValues);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CheckBill(
                      total_cost: _total_cost,
                      people_num: _people_num,
                      divided_cost: _divided_cost,
                      people_names: inputValues)));
            },
            child: Text(
              'ยืนยัน',
              style: GoogleFonts.prompt(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            children: [
              Text('หารค่าอาหาร',
                  style: GoogleFonts.prompt(
                      fontSize: 35, fontWeight: FontWeight.bold)),
              Container(
                width: 300,
                height: 100,
                color: Colors.grey[300],
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('ค่าใช้จ่ายทั้งหมด',
                          style:
                              GoogleFonts.prompt(fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: TextField(
                        enabled: false,
                        controller: _controller,
                        style: GoogleFonts.prompt(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(hintText: 'โปรดใส่ค่าอาหาร'),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 300,
                height: 100,
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'จํานวณคน',
                        style: GoogleFonts.prompt(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Transform.scale(
                                scale: 2,
                                child: IconButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () => _incrementPeople(),
                                  icon: Icon(Icons.add),
                                ),
                              )),
                          Align(
                              alignment: Alignment.center,
                              child: Text('$_people_num',
                                  style: GoogleFonts.prompt(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 60))),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Transform.scale(
                                scale: 2,
                                child: IconButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () => _decrementPeople(),
                                  icon: Icon(Icons.remove),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumpadBtn(
                          handlePress: _handlePress,
                          text: '1',
                          backgroundColor: Colors.green,
                          borderColor: Colors.green,
                          borderWidth: 10,
                          fontSize: 24),
                      NumpadBtn(
                          handlePress: _handlePress,
                          text: '2',
                          backgroundColor: Colors.green,
                          borderColor: Colors.green,
                          borderWidth: 10,
                          fontSize: 24),
                      NumpadBtn(
                          handlePress: _handlePress,
                          text: '3',
                          backgroundColor: Colors.green,
                          borderColor: Colors.green,
                          borderWidth: 10,
                          fontSize: 24),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumpadBtn(
                          handlePress: _handlePress,
                          text: '4',
                          backgroundColor: Colors.green,
                          borderColor: Colors.green,
                          borderWidth: 10,
                          fontSize: 24),
                      NumpadBtn(
                          handlePress: _handlePress,
                          text: '5',
                          backgroundColor: Colors.green,
                          borderColor: Colors.green,
                          borderWidth: 10,
                          fontSize: 24),
                      NumpadBtn(
                          handlePress: _handlePress,
                          text: '6',
                          backgroundColor: Colors.green,
                          borderColor: Colors.green,
                          borderWidth: 10,
                          fontSize: 24),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumpadBtn(
                          handlePress: _handlePress,
                          text: '7',
                          backgroundColor: Colors.green,
                          borderColor: Colors.green,
                          borderWidth: 10,
                          fontSize: 24),
                      NumpadBtn(
                          handlePress: _handlePress,
                          text: '8',
                          backgroundColor: Colors.green,
                          borderColor: Colors.green,
                          borderWidth: 10,
                          fontSize: 24),
                      NumpadBtn(
                          handlePress: _handlePress,
                          text: '9',
                          backgroundColor: Colors.green,
                          borderColor: Colors.green,
                          borderWidth: 10,
                          fontSize: 24),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _onBackSpace();
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.green, width: 10),
                            ),
                            child: Transform.scale(
                                scale: 1, child: Icon(Icons.backspace))),
                      ),
                      NumpadBtn(
                          handlePress: _handlePress,
                          text: '0',
                          backgroundColor: Colors.green,
                          borderColor: Colors.green,
                          borderWidth: 10,
                          fontSize: 24),
                      GestureDetector(
                        onTap: () {
                          //TODO arrow function
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.green, width: 10),
                            ),
                            child: Transform.scale(
                                scale: 2, child: Icon(Icons.chevron_right))),
                      ),
                    ],
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              SizedBox(
                width: 300,
                height: 60,
                child: MaterialButton(
                  onPressed: () {
                    _convertStringtoInt();
                    _divideCost();
                    _showDialog();
                  },
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.green,
                  child: Text(
                    'กดหารเลย',
                    style:
                        GoogleFonts.prompt(fontSize: 25.0, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class NumpadBtn extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final double fontSize;
  final Function(String) handlePress;

  NumpadBtn(
      {Key? key,
      required this.handlePress,
      required this.text,
      required this.backgroundColor,
      required this.borderColor,
      required this.borderWidth,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handlePress(text),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: borderWidth),
        ),
        child: Text(text, style: TextStyle(fontSize: fontSize)),
      ),
    );
  }
}
