import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dsa_simulation/src/Utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';

import '../../constants.dart';

class LinearDS extends StatefulWidget {
  @override
  _LinearDSState createState() => _LinearDSState();
}

class _LinearDSState extends State<LinearDS> {
  @override
  void dispose() {
    // removeLast();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BaseTemplate(
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
                  addElement('Array');
                  Navigator.of(context).pushNamed('/ArrayPageView');
                },
                title: 'Array',
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Tiles(
                onPress: () {
                  addElement('Stack');
                  Navigator.of(context).pushNamed('/StackIntroduction');
                },
                title: 'Stack',
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Tiles(
                onPress: () {
                  addElement('Queue');
                  Navigator.of(context).pushNamed('/QueueNavigationPage');
                },
                title: 'Queue',
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Tiles(
                onPress: () {
                  addElement('LinkedList');
                  Navigator.of(context).pushNamed('/LinkedListMainPage');
                },
                title: 'Linked List',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
