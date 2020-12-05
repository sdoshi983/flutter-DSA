import 'package:flutter/material.dart';


class LinearDS extends StatefulWidget {
  @override
  _LinearDSState createState() => _LinearDSState();
}

class _LinearDSState extends State<LinearDS> {
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
                Navigator.of(context).pushNamed('/ArrayPageView');

              },
              child: Container(
                height: height * 0.2,
                width: width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Array',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height * 0.05,
                      ),
                    ),
                    SizedBox(width: width * 0.44,),
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
              onTap: (){
                Navigator.of(context).pushNamed('/StackMainPage');
              },
              child: Container(
                height: height * 0.2,
                width: width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Stack',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height * 0.05,
                      ),
                    ),
                    SizedBox(width: width * 0.4,),
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
                      'Queue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height * 0.05,
                      ),
                    ),
                    SizedBox(width: width * 0.37,),
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
                      'Linked List',
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
          ],
        ),
      ),
    );
  }
}
