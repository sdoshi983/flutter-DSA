import 'package:dsa_simulation/src/Utilities/address_maninter.dart';
import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';

import '../../../constants.dart';

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
          appBar: AppBar(
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
          ),
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
                    Navigator.of(context).pushNamed('/BinaryTree');
                  },
                  title: 'Binary Tree',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    addElement('BST');
                    Navigator.of(context).pushNamed('/BST');
                  },
                  title: 'BST',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    addElement('AVL');
                    Navigator.of(context).pushNamed('/AvlMainPage');
                  },
                  title: 'AVL Trees',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    addElement('Traversal');
                    Navigator.of(context).pushNamed('/TreeTraversal');
                  },
                  title: 'Tree Traversal',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
