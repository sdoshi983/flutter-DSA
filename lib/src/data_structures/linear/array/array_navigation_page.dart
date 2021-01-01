import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dsa_simulation/src/constants.dart';
import 'package:dsa_simulation/src/Utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';

import 'introduction.dart';
import 'insertion.dart';
import 'deletion.dart';

class ArrayNavigator extends StatefulWidget {
  @override
  _ArrayNavigatorState createState() => _ArrayNavigatorState();
}

class _ArrayNavigatorState extends State<ArrayNavigator> {
  @override
  void dispose() {
    //removeLast();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    path = ['Home','DS','Array'];
    return WillPopScope(
      onWillPop: ()async{
        Navigator.pushNamedAndRemoveUntil(context, '/LinearNonLinearPage', (route) => false);

        return true;
      },
      child: BaseTemplate(
        body: Scaffold(
          appBar: appBar(context),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black,
              height: height * 0.9,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Tiles(
                    onPress: () {
                      addElement('Intro');

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ArrayIntro(),
                        ),
                      );
                    },
                    title: 'Introduction',
                  ),
                  Tiles(
                    title: 'Insertion',
                    onPress: () {
                      addElement('Insert');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ArrayInsert(),
                        ),
                      );
                    },
                  ),
                  Tiles(
                    onPress: () {
                      addElement('Delete');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ArrayDelete(),
                        ),
                      );
                    },
                    title: 'Deletion',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
