import 'package:flutter/material.dart';
import 'package:dsa_simulation/src/constants.dart';
import 'introduction.dart';
import 'insertion.dart';

class ArrayPageView extends StatefulWidget {
  @override
  _ArrayPageViewState createState() => _ArrayPageViewState();
}

class _ArrayPageViewState extends State<ArrayPageView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Array',
        ),
        backgroundColor: kThemeColor,
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.black,
          height: height * 0.9,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ArrayIntro(),
                    ),
                  );
                  print('New route');
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
                      SizedBox(
                        width: width * 0.25,
                      ),
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ArrayInsert(),
                    ),
                  );
                },
                child: Container(
                  height: height * 0.2,
                  width: width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Insertion',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: height * 0.05,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.25,
                      ),
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
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: height * 0.2,
                  width: width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Deletion',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: height * 0.05,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.25,
                      ),
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
      ),
    );
  }
}
