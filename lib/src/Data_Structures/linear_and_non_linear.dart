import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dsa_simulation/src/Utilities/address_maninter.dart';
import 'package:dsa_simulation/src/constants.dart';
class LinearNonLinearPage extends StatefulWidget {
  @override
  _LinearNonLinearPageState createState() => _LinearNonLinearPageState();
}

class _LinearNonLinearPageState extends State<LinearNonLinearPage> {

  @override
  void dispose() {

    removeLast();
    super.dispose();
  }
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
                addElement('Linear');
                Navigator.of(context).pushNamed('/LinearDS');
              },
              title: 'Linear',
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Tiles(
              title: 'Non-Linear',
              onPress: () {
                //remaining
              },
            )
          ],
        ),
      ),
    );
  }
}
