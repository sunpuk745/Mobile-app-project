import 'package:flutter/material.dart';

class CheckBill extends StatefulWidget {
  final int total_cost;
  final int people_num;
  final int divided_cost;
  final List people_names;
  CheckBill({Key? key, required this.total_cost, required this.people_num, required this.divided_cost, required this.people_names}): super(key: key);

  _CheckBill createState() => _CheckBill(total_cost, people_num, divided_cost, people_names);
}

class _CheckBill extends State<CheckBill> {
  final int divided_cost;
  final int total_cost;
  final int people_num;
  final List people_names;
  _CheckBill(this.total_cost, this.people_num, this.divided_cost, this.people_names);

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
                    child: Text('จํานวณคน $people_num'),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('ราคาที่ต้องจ่าย'),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 30.0,
                right: 30.0,
              ),
              width: 300,
              height: 400.0,
              child: Scrollbar(
                child: ListView.separated(
                    itemCount: people_names.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(color: Colors.grey[400]!),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        margin: EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          leading: Text('${people_names[index]}', style: TextStyle(
                              fontSize: 20
                          )),
                          trailing: Text('$divided_cost', style: TextStyle(
                              fontSize: 20
                          )),
                        )
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                      color: Colors.black26,
                    )
                )
              ),
            ),
            Padding(padding: EdgeInsets.only(
              bottom: 30,
            ),
              child: SizedBox(
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
                  color: Colors.green,
                  child: Text(
                    'กลับไปหน้าหลัก',
                    style: TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}