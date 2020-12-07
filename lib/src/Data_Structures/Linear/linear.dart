import 'package:dsa_simulation/src/Utilities/widgets.dart';
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
            SizedBox(
              height: height * 0.05,
            ),
            Tiles(
              onPress: () {
                Navigator.of(context).pushNamed('/ArrayPageView');
              },
              title: 'Array',
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Tiles(
              onPress: () {
                Navigator.of(context).pushNamed('/StackIntroduction');
              },
              title: 'Stack',
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Tiles(
              onPress: () {},
              title: 'Queue',
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Tiles(
              onPress: () {},
              title: 'Linked List',
            ),
          ],
        ),
      ),
    );
  }
}
