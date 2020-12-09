import 'package:flutter/material.dart';

import 'package:dsa_simulation/src/constants.dart';
import 'package:dsa_simulation/src/Utilities/animation_helper.dart';
import 'package:dsa_simulation/src/Utilities/address_maninter.dart';
import 'package:dsa_simulation/src/Utilities/widgets.dart';

class QNavigator extends StatefulWidget {
  @override
  _QNavigatorState createState() => _QNavigatorState();
}

class _QNavigatorState extends State<QNavigator> {
  GlobalKey _keyFirst = GlobalKey(),
      _keySecond = GlobalKey(),
      _keyThird = GlobalKey(),
      _keyFourth = GlobalKey();
  Color _firstColor = Colors.red,
      _secondColor = Colors.red,
      _thirdColor = Colors.red,
      _fourthColor = Colors.red;
  String _firstText = '1',
      _secondText = '2',
      _thirdText = '3',
      _fourthText = '4';

  @override
  void dispose() {
    removeLast();
    super.dispose();
  }

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
              'Queue',
              style: Theme.of(context).textTheme.headline6,
            ),
            Container(
              height: height * 0.15,
              width: width * 0.6,
              decoration: BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(color: Colors.white),
                  vertical: BorderSide.none,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedContainer(
                    key: _keyFirst,
                    width: width * 0.1,
                    height: height * 0.13,
                    child: Center(
                      child: Text(
                        _firstText,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: _firstColor,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    duration: Duration(milliseconds: 800),
                    curve: Curves.ease,
                  ),
                  AnimatedContainer(
                    key: _keySecond,
                    width: width * 0.1,
                    height: height * 0.13,
                    child: Center(
                      child: Text(
                        _secondText,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: _secondColor,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    duration: Duration(milliseconds: 800),
                    curve: Curves.ease,
                  ),
                  AnimatedContainer(
                    key: _keyThird,
                    width: width * 0.1,
                    height: height * 0.13,
                    child: Center(
                      child: Text(
                        _thirdText,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: _thirdColor,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    duration: Duration(milliseconds: 800),
                    curve: Curves.ease,
                  ),
                  AnimatedContainer(
                    key: _keyFourth,
                    width: width * 0.1,
                    height: height * 0.13,
                    child: Center(
                      child: Text(
                        _fourthText,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: _fourthColor,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    duration: Duration(milliseconds: 800),
                    curve: Curves.ease,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      //    reverseAnimation();
                    });
                  },
                  child: Icon(Icons.backspace_sharp),
                  color: kThemeColor,
                ),
                RaisedButton(
                    onPressed: () {
                      setState(() {
                        //   forwardAnimation();
                      });
                    },
                    child: Icon(Icons.forward),
                    color: kThemeColor),
              ],
            ),
            Container(
              height: height * 0.3,
            ),
          ],
        ),
      ),
    );
  }
}
