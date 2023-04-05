import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  Calculator({Key? key}) : super(key: key);
  
  @override
  _Calculator createState() => _Calculator();
}

class _Calculator extends State<Calculator> {
  int _people_number = 0;
  TextEditingController _controller = TextEditingController();
  String num = '';

  void _incrementPeople() {
    setState(() {
      _people_number++;
    });
  }

  void _decrementPeople() {
    setState(() {
      if (_people_number == 0) {
        _people_number = 0;
      }
      else {
        _people_number--;
      }
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
        _controller.text = _controller.text.substring(0, _controller.text.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(8)),
            Text('หารค่าอาหาร', style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold
            )),
            Container(
              width: 300,
              height: 100,
              color: Colors.grey[300],
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('ค่าใช้จ่ายทั้งหมด', style: TextStyle(
                      fontWeight: FontWeight.bold
                    )),
                  ),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: TextField(
                      enabled: false,
                      controller: _controller,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'โปรดใส่ค่าอาหาร'
                      ),
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
                    child: Text('จํานวณคน', style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),),
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
                            )
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text('$_people_number', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 60
                            ))
                          ),
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
                              )
                          ),
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
              NumpadBtn(handlePress: _handlePress, text: '1', backgroundColor: Colors.green, borderColor: Colors.green, borderWidth: 10, fontSize: 24),
              NumpadBtn(handlePress: _handlePress, text: '2', backgroundColor: Colors.green, borderColor: Colors.green, borderWidth: 10, fontSize: 24),
              NumpadBtn(handlePress: _handlePress, text: '3', backgroundColor: Colors.green, borderColor: Colors.green, borderWidth: 10, fontSize: 24),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumpadBtn(handlePress: _handlePress, text: '4', backgroundColor: Colors.green, borderColor: Colors.green, borderWidth: 10, fontSize: 24),
              NumpadBtn(handlePress: _handlePress, text: '5', backgroundColor: Colors.green, borderColor: Colors.green, borderWidth: 10, fontSize: 24),
              NumpadBtn(handlePress: _handlePress, text: '6', backgroundColor: Colors.green, borderColor: Colors.green, borderWidth: 10, fontSize: 24),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumpadBtn(handlePress: _handlePress, text: '7', backgroundColor: Colors.green, borderColor: Colors.green, borderWidth: 10, fontSize: 24),
              NumpadBtn(handlePress: _handlePress, text: '8', backgroundColor: Colors.green, borderColor: Colors.green, borderWidth: 10, fontSize: 24),
              NumpadBtn(handlePress: _handlePress, text: '9', backgroundColor: Colors.green, borderColor: Colors.green, borderWidth: 10, fontSize: 24),
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
                      border: Border.all(
                          color: Colors.green,
                          width: 10
                      ),
                    ),
                    child: Transform.scale(
                        scale: 1,
                        child: Icon(Icons.backspace)
                    )
                ),
              ),
              NumpadBtn(handlePress: _handlePress, text: '0', backgroundColor: Colors.green, borderColor: Colors.green, borderWidth: 10, fontSize: 24),
              GestureDetector(
                onTap: () {
                  //TODO Next page
                },
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.green,
                          width: 10
                      ),
                    ),
                    child: Transform.scale(
                        scale: 2,
                        child: Icon(Icons.chevron_right)
                    )
                ),
              ),
            ],
          )
        ],
      ),
            Padding(padding: EdgeInsets.only(
              top: 50
            )),
            SizedBox(
              width: 300,
              height: 60,
              child: MaterialButton(
                onPressed: () {
                  // TODO
                },
                // ignore: unnecessary_new
                shape: new RoundedRectangleBorder(
                  // ignore: unnecessary_new
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.green,
                child: Text(
                  'กดหารเลย',
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

class NumpadBtn extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final double fontSize;
  final Function(String) handlePress;

  NumpadBtn({Key? key, required this.handlePress, required this.text, required this.backgroundColor, required this.borderColor, required this.borderWidth, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handlePress(text),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: Border.all(
              color: borderColor,
              width: borderWidth
          ),
        ),
        child: Text(text, style: TextStyle(fontSize: fontSize),),
      ),
    );
  }
}
