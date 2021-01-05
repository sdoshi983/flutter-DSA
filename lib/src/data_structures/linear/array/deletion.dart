import 'package:flutter/material.dart';
import 'package:dsa_simulation/src/Utilities/animation_helper.dart';
import 'package:dsa_simulation/src/constants.dart';
import 'package:dsa_simulation/src/Utilities/address_maninter.dart';
import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';

class Element extends StatelessWidget {
  final Color color;
  final String name;

  const Element({Key key, this.color, this.name});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      key: key,
      width: w * 0.2,
      height: h * 0.05,
      child: Center(
        child: Text(
          '$name',
          style: TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(9),
      ),
      duration: Duration(milliseconds: 800),
      curve: Curves.ease,
    );
  }
}

class ArrayDelete extends StatefulWidget {
  @override
  _ArrayDeleteState createState() => _ArrayDeleteState();
}

class _ArrayDeleteState extends State<ArrayDelete>
    with SingleTickerProviderStateMixin {
  int currentState = 0;
  Offset _thirdElementOffset, _fourthElementOffset;
  Size _arrayElementSize;
  GlobalKey _keyThird = GlobalKey(), _keyFourth = GlobalKey();
  double liftValue = 0.0;
  double heightFactor = 0.4;
  Color delElementColor = Colors.cyan;
  String delElementText = 'BBye';
  AnimationController _controller;
  Animation<Offset> _liftOffset, _downOffset;
  bool flag = false;

  void forwardAnimation() {
    if (currentState == 0) {
      delElementText = '';
      delElementColor = Colors.white54;
      if (!flag) {
        flag = true;
        _arrayElementSize = getSizes(_keyFourth);
        _thirdElementOffset = getPositions(_keyThird);
        _fourthElementOffset = getPositions(_keyFourth);
        liftValue = -(_fourthElementOffset.dy - _thirdElementOffset.dy) /
            _arrayElementSize.height;
        _liftOffset =
            Tween<Offset>(begin: Offset.zero, end: Offset(0, liftValue))
                .animate(
          CurvedAnimation(parent: _controller, curve: Curves.ease),
        );
        _downOffset =
            Tween<Offset>(begin: Offset.zero, end: Offset(0, -3 * liftValue))
                .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.ease,
          ),
        );
      }
    } else if (currentState == 1) {
      //    print('Controller');
      _controller.forward();
    } else if (currentState == 2) {
      delElementColor = Colors.transparent;
      heightFactor = 0.37;
    }
    currentState += 1;
  }

  void reverseAnimation() {
    if (currentState == 1) {
      delElementText = 'BBye';
      delElementColor = Colors.cyan;
    } else if (currentState == 2) {
      _controller.reverse();
    } else if (currentState == 3) {
      delElementColor = Colors.white54;
      heightFactor = 0.4;
    }

    currentState -= 1;
  }

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    _liftOffset =
        Tween<Offset>(begin: Offset.zero, end: Offset(0, liftValue)).animate(
      CurvedAnimation(parent: _controller, curve: Curves.ease),
    );
    _downOffset =
        Tween<Offset>(begin: Offset.zero, end: Offset(0, -3 * liftValue))
            .animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    removeLast();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BaseTemplate(
      body: Scaffold(
        appBar: appBar(context),
        body: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Deletion in Array',
                style: Theme.of(context).textTheme.headline6,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 800),
                curve: Curves.ease,
                height: heightFactor * height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Element(
                      name: 'Hello',
                      color: Colors.green,
                    ),
                    SlideTransition(
                      position: _downOffset,
                      child: Element(
                        name: delElementText,
                        color: delElementColor,
                      ),
                    ),
                    SlideTransition(
                      position: _liftOffset,
                      child: AnimatedContainer(
                        key: _keyThird,
                        width: width * 0.2,
                        height: height * 0.05,
                        child: Center(
                          child: Text(
                            'World',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        duration: Duration(milliseconds: 800),
                        curve: Curves.ease,
                      ),
                    ),
                    SlideTransition(
                      position: _liftOffset,
                      child: AnimatedContainer(
                        key: _keyFourth,
                        width: width * 0.2,
                        height: height * 0.05,
                        child: Center(
                          child: Text(
                            'Heyy',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        duration: Duration(milliseconds: 800),
                        curve: Curves.ease,
                      ),
                    ),
                    SlideTransition(
                      position: _liftOffset,
                      child: AnimatedContainer(
                        width: width * 0.2,
                        height: height * 0.05,
                        child: Center(
                          child: Text(
                            'Ok',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        duration: Duration(milliseconds: 800),
                        curve: Curves.ease,
                      ),
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
                        reverseAnimation();
                      });
                    },
                    child: Icon(Icons.backspace_sharp),
                    color: kThemeColor,
                  ),
                  RaisedButton(
                      onPressed: () {
                        setState(() {
                          forwardAnimation();
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
      ),
    );
  }
}
