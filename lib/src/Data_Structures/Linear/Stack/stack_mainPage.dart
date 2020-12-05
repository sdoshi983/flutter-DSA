import 'package:flutter/material.dart';


class StackMainPage extends StatefulWidget {
  @override
  _StackMainPageState createState() => _StackMainPageState();
}

class _StackMainPageState extends State<StackMainPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.05,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed('/StackIntroduction');

              },
              child: Container(
                height: height * 0.2,
                width: width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Introduction',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height * 0.05,
                      ),
                    ),
                    SizedBox(width: width * 0.2,),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFFE752F),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            GestureDetector(
              onTap: (){},
              child: Container(
                height: height * 0.2,
                width: width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Push and Pop Operations',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height * 0.037,
                      ),
                    ),
                    //SizedBox(width: width * 0.08,),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFFE752F),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
