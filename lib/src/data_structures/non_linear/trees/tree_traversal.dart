import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';
import 'package:dsa_simulation/src/utilities/widgets.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class TreeTraversal extends StatefulWidget {
  @override
  _TreeTraversalState createState() => _TreeTraversalState();
}

class _TreeTraversalState extends State<TreeTraversal> {
  @override
  void initState() {

    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    path = ['Home','DS','Tree','Traversal'];
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, '/TreeMain', (route) => false);
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
                    Navigator.of(context).pushReplacementNamed('/PreOrder');
                  },
                  title: 'Pre-Order',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    Navigator.of(context).pushReplacementNamed('/PostOrder');
                  },
                  title: 'Post-Order',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    Navigator.of(context).pushReplacementNamed('/InOrder');
                  },
                  title: 'In-Order',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
              //      addElement('Traversal');
                    Navigator.of(context).pushReplacementNamed('/LevelOrder');
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
