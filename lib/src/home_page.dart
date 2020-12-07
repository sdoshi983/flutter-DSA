import 'package:flutter/material.dart';
import 'package:dsa_simulation/route_generator.dart';
import '../src/constants.dart';
import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:dsa_simulation/src/Utilities/address_maninter.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              height: height * 0.3,
            ),
            Tiles(
              onPress: () {
                addElement('DS');
                Navigator.of(context).pushNamed('/LinearNonLinearPage');
              },
              title: 'D.S.',
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Tiles(
              onPress: () {
                //remaining
              },
              title: 'Algorithms',
            )
          ],
        ),
      ),
    );
  }
}
