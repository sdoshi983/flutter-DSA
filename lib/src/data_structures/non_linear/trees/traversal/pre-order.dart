import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';
import 'package:dsa_simulation/src/utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:widget_arrows/widget_arrows.dart';

import '../../../../constants.dart';
import '../tree_introduction.dart';

class PreOrderTraversal extends StatefulWidget {
  @override
  _PreOrderTraversalState createState() => _PreOrderTraversalState();
}

class _PreOrderTraversalState extends State<PreOrderTraversal> {
  double tipLength = 5;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print('Build Method Starts');
    print(path);
    path = ['Home', 'DS', 'Trees', 'Traversal', 'Pre-Order'];
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
                child: Container(
                    width: width * 0.9, height: 30, child: AddressBar())),
          ),
          body: Container(
            height: height*0.9,
            width: width,
            color: Colors.black,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pre-Order Tree Traversal',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white),
                  ),
                  Container(
                    height: height*0.6,
                    width: width,
                    color: Colors.greenAccent,
                    child: Stack(
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          height: width*0.12,
                          decoration: BoxDecoration(
                            color: Colors.red,

                            shape: BoxShape.circle,
                          ),
                        )
                      ],

                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
