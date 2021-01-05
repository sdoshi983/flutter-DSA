import 'package:dsa_simulation/src/Utilities/address_maninter.dart';
import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';

class TreeMainScreen extends StatefulWidget {
  @override
  _TreeMainScreenState createState() => _TreeMainScreenState();
}

class _TreeMainScreenState extends State<TreeMainScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    path = ['Home', 'DS', 'Trees'];
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, '/LinearNonLinearPage', (route) => false);
        return true;
      },
      child: BaseTemplate(
        body: Scaffold(
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
                    addElement('Intro');
                    Navigator.of(context).pushNamed('/TreeIntro');
                  },
                  title: 'Introduction',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    addElement('BT');
                    Navigator.of(context).pushNamed('/DoublyMainPage');
                  },
                  title: 'Binary Tree',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    addElement('BST');
                    Navigator.of(context).pushNamed('/DoublyMainPage');
                  },
                  title: 'Binary Search T',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    addElement('BST');
                    Navigator.of(context).pushNamed('/DoublyMainPage');
                  },
                  title: 'Avalance Tree',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
