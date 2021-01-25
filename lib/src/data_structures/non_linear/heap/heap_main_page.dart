import 'package:dsa_simulation/src/Utilities/address_maninter.dart';
import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';

import '../../../constants.dart';

class HeapMainPage extends StatefulWidget {
  @override
  _HeapMainPageState createState() => _HeapMainPageState();
}

class _HeapMainPageState extends State<HeapMainPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    path = ['Home', 'DS', 'Heaps'];
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
                    Navigator.of(context).pushNamed('/HeapIntroduction');
                  },
                  title: 'Introduction',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    addElement('Insertion');
                    Navigator.of(context).pushNamed('/HeapInsertion');
                  },
                  title: 'Insertion',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    addElement('Deletion ');
                    Navigator.of(context).pushNamed('/HeapDeletion');
                  },
                  title: 'Deletion',
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
