import 'package:flutter/material.dart';
import 'package:dsa_simulation/src/constants.dart';
import 'package:dsa_simulation/src/Utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';

class Tiles extends StatelessWidget {
  final String title;
  final Function onPress;

  const Tiles({this.onPress, this.title});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        height: height * 0.15,
        width: width * 0.85,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$title',
              style: TextStyle(
                color: Colors.white,
                fontSize: height * 0.05,
              ),
            ),
            SizedBox(
              width: width * 0.09,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: kThemeColor,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

Widget appBar(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  return AppBar(
    leading: ClipRect(
      child: MaterialButton(
        child: Icon(Icons.menu_rounded),
        onPressed: () {
          toggle();
        },
        splashColor: Colors.black,
      ),
    ),
    backgroundColor: kThemeColor,
    iconTheme: IconThemeData(color: Colors.white),
    title: Center(
        child: Container(width: width * 0.9, height: 30, child: AddressBar())),
  );
}
