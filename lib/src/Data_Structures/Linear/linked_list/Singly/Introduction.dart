import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class SinglyIntroduction extends StatefulWidget {
  @override
  _SinglyIntroductionState createState() => _SinglyIntroductionState();
}

class _SinglyIntroductionState extends State<SinglyIntroduction> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar(context),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Introduction to Singly Linked List',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: height * 0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height * 0.05,
                  width: width * 0.2,
                  child: Center(child: Text('Data')),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    //borderRadius: BorderRadius.circular(20),
                  ),
                ),

                Container(
                  height: height * 0.05,
                  width: width * 0.2,
                  child: Center(child: Text('Data')),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    //borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  height: height * 0.05,
                  width: width * 0.2,
                  child: Center(child: Text('Data')),
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    //borderRadius: BorderRadius.circular(20),
                  ),
                ),

              ],
            ),
            Container(
              height: height * 0.05,
              width: width * 0.2,
              child: Center(child: Text('Data')),
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                //borderRadius: BorderRadius.circular(20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      //reverseAnimation();
                    });
                  },
                  child: Icon(Icons.backspace_sharp),
                  color: kThemeColor,
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      //forwardAnimation();
                    });
                  },
                  child: Icon(Icons.forward),
                  color: kThemeColor,
                ),
              ],
            ),
            Container(
              height: height * 0.3,
            )
          ],
        ),
      ),
    );
  }
}

