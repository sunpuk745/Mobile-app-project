import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  final Color background_color = const Color(0xffF0ECCF);
  final Color button_color = const Color(0xff7AA874);

  final Color title_text_color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                  Image.asset('images/Logo.png', width: 250, height: 250,),
                  Image.asset('images/1933833.png', width: 150, height: 150,),
                  Padding(padding: EdgeInsets.only(top: 50)),
                  SizedBox(
                    width: 300,
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/eat');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(button_color),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      child: Text(
                        'กินอะไรดี',
                        style: GoogleFonts.prompt(fontSize: 25),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 300,
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/calcurate');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(button_color),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      child: Text(
                        'หารค่าอาหาร',
                        style: GoogleFonts.prompt(fontSize: 25),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 80)),
                ],
              ),
            )
          );
  }
}
