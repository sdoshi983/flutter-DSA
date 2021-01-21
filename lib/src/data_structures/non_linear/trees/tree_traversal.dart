import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';
import 'package:dsa_simulation/src/utilities/widgets.dart';
import 'package:flutter/material.dart';

class TreeTraversal extends StatefulWidget {
  @override
  _TreeTraversalState createState() => _TreeTraversalState();
}

class _TreeTraversalState extends State<TreeTraversal> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    path = ['Home', 'DS', 'Trees','Traversal'];
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
                //    addElement('Intro');
                //    Navigator.of(context).pushNamed('/TreeIntro');
                  },
                  title: 'Pre-Order',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    addElement('BT');
                    Navigator.of(context).pushNamed('/BinaryTree');
                  },
                  title: 'Post-Order',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    addElement('BST');
                    Navigator.of(context).pushNamed('/DoublyMainPage');
                  },
                  title: 'In-Order',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    addElement('Traversal');
                    Navigator.of(context).pushNamed('/TreeTraversal');
                  },
                  title: 'Level Order',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
