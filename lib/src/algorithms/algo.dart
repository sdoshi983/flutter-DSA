import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';
import 'package:dsa_simulation/src/utilities/widgets.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AlgoMain extends StatefulWidget {
  @override
  _AlgoMainState createState() => _AlgoMainState();
}

class _AlgoMainState extends State<AlgoMain> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    path = ['Home','ALGO'];
    return WillPopScope(
      onWillPop: (){
        Navigator.pushReplacementNamed(context, '/Home');

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
                    addElement('Sort');
                    Navigator.of(context).pushNamed('/Sorting');
                  },
                  title: 'Sort Algo',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    addElement('Recursive');
                    Navigator.of(context).pushNamed('/Recursive');
                  },
                  title: 'Recursive',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    addElement('Maze Solver');
                    Navigator.of(context).pushNamed('/MazeSolver');
                  },
                  title: 'Maze Solver',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    addElement('Graph Coloring');
                    Navigator.of(context).pushNamed('/GraphColoring');
                  },
                  title: 'Graph Color',
                ),
              ],
            ),
          ),
        ),
      ),
    );;
  }
}
