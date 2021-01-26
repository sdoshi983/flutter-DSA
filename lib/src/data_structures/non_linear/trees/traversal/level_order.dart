import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';
import 'package:dsa_simulation/src/utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:widget_arrows/widget_arrows.dart';

import '../../../../constants.dart';
import '../tree_introduction.dart';

class LevelOrderTraversal extends StatefulWidget {
  @override
  _LevelOrderTraversalState createState() => _LevelOrderTraversalState();
}

class _LevelOrderTraversalState extends State<LevelOrderTraversal> {
  int visited = 0;
  double top = 0, left = 0;
  double container = 0;
  double ok = 0.2;
  double tipLength = 5;
  int state = 0;
  int currentElement = -1;
  void forward() async {
    if (state == 0) {
      currentElement = 1;
      visited++;
    } else if (state == 1) {
      ok = 0.6;
      container = 0.08;
      top = 0.1;
      currentElement = 10;
      visited++;
    } else if (state == 2) {
      currentElement = 5;
      visited++;
    } else if (state == 3) {
      container = 0.19;
      ok = 0.76;
      currentElement = 7;
      visited++;
      top = 0.19;
    } else if (state == 4) {
      visited++;
      currentElement = 2;
    } else if (state == 5) {
      visited++;
      currentElement = 0;
    } else if (state == 6) {
      visited++;
      currentElement = 4;
    } else
      return;
    state++;
  }

  void reverse() {
    if (state <= 0) return;
    if (state == 1) {
      currentElement = -1;
      visited--;
    } else if (state == 2) {
      visited--;
      currentElement = 1;
      ok = 0.2;
      top = 0;
      container = 0;
    } else if (state == 3) {
      visited--;
      currentElement = 10;
    } else if (state == 4) {
      visited--;
      currentElement = 5;
      ok = 0.6;
      container = 0.08;
      top = 0.1;
    } else if (state == 5) {
      visited--;
      currentElement = 7;
    } else if (state == 6) {
      visited--;
      currentElement = 2;
    } else if (state == 7) {
      visited--;
      currentElement = 0;
    }

    state--;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    path = ['Home', 'DS', 'Trees', 'Traversal', 'Level-Order'];

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, '/TreeTraversal', (route) => false);
        return true;
      },
      child: ArrowContainer(
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
                  width: width * 0.9,
                  height: 30,
                  child: AddressBar(),
                ),
              ),
            ),
            body: Container(
              width: width,
              color: Colors.black,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Level-Order Tree Traversal',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),
                    ),
                    Container(
                      height: height * 0.6,
                      width: width,
                      color: Colors.black,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedPositioned(
                            top: container * height,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 600),
                              width: width * ok,
                              height: height * 0.09,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: state > 0
                                      ? kThemeColor
                                      : Colors.transparent,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            duration: Duration(
                              milliseconds: 600,
                            ),
                          ),
                          ArrowElement(
                            id: '01',
                            targetId: '5',
                            sourceAnchor: Alignment.centerRight,
                            targetAnchor: Alignment.topCenter,
                            color: Colors.white,
                            child: ArrowElement(
                              id: '1',
                              targetId: '10',
                              sourceAnchor: Alignment.centerLeft,
                              targetAnchor: Alignment.topCenter,
                              color: Colors.white,
                              child: Positioned(
                                top: 10,
                                child: AnimatedContainer(
                                  child: Center(
                                    child: Text(
                                      '1',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 500),
                                  height: width * 0.12,
                                  width: width * 0.12,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: currentElement == 1
                                          ? Colors.indigo
                                          : Colors.white,
                                      width: currentElement == 1 ? 5 : 3,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //1
                          ArrowElement(
                            id: '010',
                            targetId: '2',
                            sourceAnchor: Alignment.centerRight,
                            targetAnchor: Alignment.topCenter,
                            color: Colors.white,
                            flip: true,
                            child: ArrowElement(
                              id: '10',
                              targetId: '7',
                              sourceAnchor: Alignment.centerLeft,
                              targetAnchor: Alignment.topCenter,
                              color: Colors.white,
                              flip: true,
                              child: Positioned(
                                top: height * 0.1,
                                left: width * 0.25,
                                child: AnimatedContainer(
                                  child: Center(
                                    child: Text(
                                      '10',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 500),
                                  height: width * 0.12,
                                  width: width * 0.12,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: currentElement == 10
                                          ? Colors.indigo
                                          : Colors.white,
                                      width: currentElement == 10 ? 5 : 3,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //10
                          ArrowElement(
                            id: '05',
                            targetId: '4',
                            sourceAnchor: Alignment.centerRight,
                            targetAnchor: Alignment.topCenter,
                            color: Colors.white,
                            flip: true,
                            child: ArrowElement(
                              id: '5',
                              targetId: '0',
                              sourceAnchor: Alignment.centerLeft,
                              targetAnchor: Alignment.topCenter,
                              color: Colors.white,
                              flip: true,
                              child: Positioned(
                                top: height * 0.1,
                                right: width * 0.25,
                                child: AnimatedContainer(
                                  child: Center(
                                      child: Text(
                                    '5',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  )),
                                  duration: Duration(milliseconds: 500),
                                  height: width * 0.12,
                                  width: width * 0.12,
                                  decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: currentElement == 5
                                          ? Colors.indigo
                                          : Colors.white,
                                      width: currentElement == 5 ? 5 : 3,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //5
                          ArrowElement(
                            id: '7',
                            child: Positioned(
                              top: height * 0.2,
                              left: width * 0.15,
                              child: AnimatedContainer(
                                child: Center(
                                  child: Text(
                                    '7',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                                duration: Duration(milliseconds: 500),
                                height: width * 0.12,
                                width: width * 0.12,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: currentElement == 7
                                        ? Colors.indigo
                                        : Colors.white,
                                    width: currentElement == 7 ? 5 : 3,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //7
                          ArrowElement(
                            id: '2',
                            child: Positioned(
                              top: height * 0.2,
                              left: width * 0.35,
                              child: AnimatedContainer(
                                child: Center(
                                    child: Text(
                                  '2',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                )),
                                duration: Duration(milliseconds: 500),
                                height: width * 0.12,
                                width: width * 0.12,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: currentElement == 2
                                        ? Colors.indigo
                                        : Colors.white,
                                    width: currentElement == 2 ? 5 : 3,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //2

                          ArrowElement(
                            id: '0',
                            child: Positioned(
                              top: height * 0.2,
                              right: width * 0.35,
                              child: AnimatedContainer(
                                child: Center(
                                    child: Text(
                                  '0',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                )),
                                duration: Duration(milliseconds: 500),
                                height: width * 0.12,
                                width: width * 0.12,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: currentElement == 0
                                        ? Colors.indigo
                                        : Colors.white,
                                    width: currentElement == 0 ? 5 : 3,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //0
                          ArrowElement(
                            id: '4',
                            child: Positioned(
                              top: height * 0.2,
                              right: width * 0.15,
                              child: AnimatedContainer(
                                child: Center(
                                    child: Text(
                                  '4',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                )),
                                duration: Duration(milliseconds: 500),
                                height: width * 0.12,
                                width: width * 0.12,
                                decoration: BoxDecoration(
                                  color: Colors.pink,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: currentElement == 4
                                        ? Colors.indigo
                                        : Colors.white,
                                    width: currentElement == 4 ? 5 : 3,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //4
                          Positioned(
                            bottom: 0,
                            left: width * 0.08,
                            child: Container(
                              width: width,
                              height: height * 0.1,
                              child: Row(
                                children: [
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    height: width * 0.13,
                                    width: width * 0.12,
                                    child: Center(
                                      child: Text(
                                        visited > 0 ? '1' : '',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: visited > 0
                                          ? kThemeColor
                                          : Colors.transparent,
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                    ),
                                  ),
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    height: width * 0.13,
                                    width: width * 0.12,
                                    child: Center(
                                      child: Text(
                                        visited > 1 ? '10' : '',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: visited > 1
                                          ? kThemeColor
                                          : Colors.transparent,
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                    ),
                                  ),
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    height: width * 0.13,
                                    width: width * 0.12,
                                    child: Center(
                                      child: Text(
                                        visited > 2 ? '5' : '',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: visited > 2
                                          ? kThemeColor
                                          : Colors.transparent,
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                    ),
                                  ),
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    height: width * 0.13,
                                    width: width * 0.12,
                                    child: Center(
                                      child: Text(
                                        visited > 3 ? '7' : '',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: visited > 3
                                          ? kThemeColor
                                          : Colors.transparent,
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                    ),
                                  ),
                                  AnimatedContainer(
                                    child: Center(
                                      child: Text(
                                        visited > 4 ? '2' : '',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 500),
                                    height: width * 0.13,
                                    width: width * 0.12,
                                    decoration: BoxDecoration(
                                      color: visited > 4
                                          ? kThemeColor
                                          : Colors.transparent,
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                    ),
                                  ),
                                  AnimatedContainer(
                                    child: Center(
                                      child: Text(
                                        visited > 5 ? '0' : '',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 500),
                                    height: width * 0.13,
                                    width: width * 0.12,
                                    decoration: BoxDecoration(
                                      color: visited > 5
                                          ? kThemeColor
                                          : Colors.transparent,
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                    ),
                                  ),
                                  AnimatedContainer(
                                    child: Center(
                                      child: Text(
                                        visited > 6 ? '4' : '',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 500),
                                    height: width * 0.13,
                                    width: width * 0.12,
                                    decoration: BoxDecoration(
                                      color: visited > 6
                                          ? kThemeColor
                                          : Colors.transparent,
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 500),
                            top: height * top + 10,
                            left: width * left + 10,
                            curve: Curves.ease,
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 700),
                              opacity: state > 0 ? 1 : 0,
                              child: Text(
                                '😇',
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
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
                              reverse();
                            });
                          },
                          child: Icon(Icons.backspace_sharp),
                          color: kThemeColor,
                        ),
                        RaisedButton(
                            onPressed: () {
                              setState(() {
                                forward();
                                print(currentElement);
                              });
                            },
                            child: Icon(Icons.forward),
                            color: kThemeColor),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
