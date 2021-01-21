import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';
import 'package:dsa_simulation/src/utilities/widgets.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class PreOrderTraversal extends StatefulWidget {
  @override
  _PreOrderTraversalState createState() => _PreOrderTraversalState();
}

class _PreOrderTraversalState extends State<PreOrderTraversal> {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print('Build Method Starts');
    print(path);
    path = ['Home', 'DS', 'Trees','Traversal','Pre-Order'];
    print(path);
    print('build method ends');
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, '/TreeTraversal', (route) => false);
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
          body: Container(height: height*0.9,width: width,),
        ),
      ),
    );
  }
}
