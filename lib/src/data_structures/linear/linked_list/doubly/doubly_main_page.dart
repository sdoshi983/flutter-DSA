import 'package:dsa_simulation/src/Data_Structures/Linear/linked_list/doubly/doubly_introduction.dart';
import 'package:dsa_simulation/src/Utilities/address_maninter.dart';
import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';
import 'doubly_insertion.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';

class DoublyMainPage extends StatefulWidget {
  @override
  _DoublyMainPageState createState() => _DoublyMainPageState();
}

class _DoublyMainPageState extends State<DoublyMainPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    path = ['Home', 'DS', 'Linked List', 'Doubly'];

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, '/LinkedListMainPage', (route) => false);

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
                    addElement('Introduction');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DoublyIntroduction(),
                      ),
                    );
                  },
                  title: 'Introduction',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    addElement('Insertion');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DoublyInsertion(),
                      ),
                    );
                  },
                  title: 'Insertion',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    addElement('Deletion');
                    Navigator.of(context).pushNamed('/DoublyDeletionPage');
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
