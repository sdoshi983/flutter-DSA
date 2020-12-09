import 'package:dsa_simulation/src/Utilities/address_maninter.dart';
import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:flutter/material.dart';

class LinkedListMainPage extends StatefulWidget {
  @override
  _LinkedListMainPageState createState() => _LinkedListMainPageState();
}

class _LinkedListMainPageState extends State<LinkedListMainPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar(context),
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
                addElement('Introduction');
                Navigator.of(context).pushNamed('/ArrayPageView');
              },
              title: 'Introduction',
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Tiles(
              onPress: () {
                addElement('Singly');
                Navigator.of(context).pushNamed('/StackIntroduction');
              },
              title: 'Singly',
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Tiles(
              onPress: () {},
              title: 'Doubly',
            ),

          ],
        ),
      ),
    );
  }
}
