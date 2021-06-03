import 'package:dsa_simulation/src/algorithms/sorting/bubble_sort.dart';
import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';
import 'package:dsa_simulation/src/utilities/widgets.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class SortMain extends StatefulWidget {
  @override
  _SortMainState createState() => _SortMainState();
}

class _SortMainState extends State<SortMain> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    path = ['Home','ALGO','Sorting'];
    return WillPopScope(
      onWillPop: (){
        Navigator.pushReplacementNamed(context, '/AlgoMain');

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
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>BubbleSort(),),);
                  },
                  title: 'Bubble',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    Navigator.of(context).pushNamed('/Recursive');
                  },
                  title: 'Selection',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    Navigator.of(context).pushNamed('/MazeSolver');
                  },
                  title: 'Insertion',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {

                    Navigator.of(context).pushNamed('/GraphColoring');
                  },
                  title: 'Merge',
                ),
              ],
            ),
          ),
        ),
      ),
    );;
  }
}
