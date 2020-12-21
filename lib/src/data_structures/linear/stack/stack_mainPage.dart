import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';

class StackMainPage extends StatefulWidget {
  @override
  _StackMainPageState createState() => _StackMainPageState();
}

class _StackMainPageState extends State<StackMainPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BaseTemplate(
      body: Scaffold(
        body: Container(
          height: height,
          width: width,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Tiles(
                title: 'Introduction',
                onPress: () {
                  Navigator.of(context).pushNamed('/StackIntroduction');
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Tiles(
                title: 'Push and Pop Operation',
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
