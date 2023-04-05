import 'package:flutter/material.dart';

class CheckBill extends StatefulWidget {
  final int total_cost;
  final int people_num;
  final int divided_cost;
  CheckBill({Key? key, required this.total_cost, required this.people_num, required this.divided_cost}): super(key: key);

  _CheckBill createState() => _CheckBill(total_cost, people_num, divided_cost);
}

class _CheckBill extends State<CheckBill> {
  final int divided_cost;
  final int total_cost;
  final int people_num;
  _CheckBill(this.total_cost, this.people_num, this.divided_cost);


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
              height: 70,
              color: Colors.grey[300],
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('คนละ', style: TextStyle(
                      fontWeight: FontWeight.bold
                    )),
                  ),
                  Padding(padding: EdgeInsets.only(
                    left: 15
                  )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: TextField(
                        readOnly: true,
                        enabled: false,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '$divided_cost', hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 300,
              height: 30,
              color: Colors.grey[300],
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('ค่าใช้จ่ายทั้งหมด $total_cost', style: TextStyle(
                    fontWeight: FontWeight.bold
                )),
              ),
            ),
            Container(
              width: 300,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('จํานวณคน $people_num'), //TODO pass down value
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('ราคาที่ต้องจ่าย'),
                  )
                ],
              ),
            ),
            //TODO Scroll bar of people
          ],
        ),
      ),
    );
  }
}