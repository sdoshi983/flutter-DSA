import 'package:flutter/material.dart';
import 'package:dsa_simulation/src/constants.dart';
import 'introduction.dart';
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
        title: Text('Array',),
        backgroundColor: kThemeColor,
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.black,
          height: height * 0.9,
          width: width,
          child: PageView(
            children: [
             ArrayIntro(),
              Container(
                color: Colors.red,
                height: 100,
                width: 100,
              ),
              Container(
                color: Colors.blue,
                height: 100,
                width: 100,
              ),
              Container(
                color: Colors.red,
                height: 100,
                width: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
