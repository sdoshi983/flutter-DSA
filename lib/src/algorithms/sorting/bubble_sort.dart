import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class BubbleSort extends StatefulWidget {
  List<double>toSort = [2,3,5,1,2,6];
  int mx = 6;

  @override
  _BubbleSortState createState() => _BubbleSortState();
}

class _BubbleSortState extends State<BubbleSort> {
  @override
  Widget build(BuildContext context) {
    path = ['Home', 'ALGO', 'Sorting', 'Bubble'];

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
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
            child: Container(
              width: w * 0.9,
              height: 30,
              child: AddressBar(),
            ),
          ),
        ),
        body: Container(
          width: w,
         height: h*0.9,
         child: Center(
           child: Column(
             children: [
               Container(
                 width: w,
                 height: 100,
                 child: Center(
                   child: ListView.builder(
                     itemBuilder: (_,i){

                     return Container(
                       width: min(40,(w*0.9)/widget.toSort.length),
                       height: (widget.toSort[i]/widget.mx)*10,
                       color: Colors.red.withOpacity(widget.toSort[i]/widget.mx),
                       child: Center(child: Text(widget.toSort[i].toInt().toString())),
                     );
                   },

                     itemCount: widget.toSort.length,
                     scrollDirection: Axis.horizontal,
                   ),
                 ),
               )
             ],
           ),
         ),
        ),
      ),
    );
  }
}

double min(double i, double d) {
  if(i < d)return i;
  return d;
}
