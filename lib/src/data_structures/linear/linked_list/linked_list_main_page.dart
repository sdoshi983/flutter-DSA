import 'package:dsa_simulation/src/Utilities/address_maninter.dart';
import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';

class LinkedListMainPage extends StatefulWidget {
  @override
  _LinkedListMainPageState createState() => _LinkedListMainPageState();
}

class _LinkedListMainPageState extends State<LinkedListMainPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    path = ['Home','DS','Linked List'];

    return WillPopScope(
      onWillPop: ()async{
        Navigator.pushNamedAndRemoveUntil(context, '/LinearNonLinearPage', (route) => false);
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
                    addElement('Singly');
                    Navigator.of(context).pushNamed('/SinglyMainPage');
                  },
                  title: 'Singly',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                  addElement('Doubly');
                  Navigator.of(context).pushNamed('/DoublyMainPage');
                  },
                  title: 'Doubly',
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
