import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';
import 'package:dsa_simulation/src/utilities/triangle_creator.dart';
import 'package:dsa_simulation/src/utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:widget_arrows/widget_arrows.dart';

import '../../../../constants.dart';
import '../tree_introduction.dart';

class BstIntroduction extends StatefulWidget {
  @override
  _BstIntroductionState createState() => _BstIntroductionState();
}

class _BstIntroductionState extends State<BstIntroduction> {
  double tipLength = 5;
  int currentElement = -1;
  int mxCurrentElement = 100;
  double first = 0.00, second = 0.00, third = 0, fourth = 0;
  int state = 0;
  void forward() {
    if (state == 0) {
      first = 1;
    } else if (state == 1) {
      first = 0;
      second = 1;
    } else if (state == 2) {
      second = 0;
      third = 1;
    } else if (state == 3) {
      third = 0;
      fourth = 1;
    } else if (state == 4) {
      fourth = 0;
    } else
      return;
    state++;
  }

  void reverse() {
    if (state <= 0) return;
    if (state == 1) {
      first = 0;
    } else if (state == 2) {
      first = 1;
      second = 0;
    } else if (state == 3) {
      second = 1;
      third = 0;
    } else if (state == 4) {
      third = 1;
      fourth =0;
    } else if (state == 5) {
      fourth = 1;
    }

    state--;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    path = ['Home', 'DS', 'Trees', 'BST', 'Intro'];

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, '/TreeTraversal', (route) => false);
        return true;
      },
      child: BaseTemplate(
        body: ArrowContainer(
          child: Scaffold(
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
                      'BST Introduction',
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
                          Positioned(
                            top: height * 0.05,
                            left: width * 0.03,
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 700),
                              opacity: first,
                              child: CustomPaint(
                                painter: TriangleCreator(),
                                child: Container(
                                  height: height * 0.25,
                                  width: width * 0.55,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: height * 0.05,
                            right: width * 0.03,
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 700),
                              opacity: second,
                              child: CustomPaint(
                                painter: TriangleCreator(),
                                child: Container(
                                  height: height * 0.25,
                                  width: width * 0.55,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: height * 0.14,
                            left: width * 0.08,
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 700),
                              opacity: third,
                              child: CustomPaint(
                                painter: TriangleCreator(),
                                child: Container(
                                  height: height * 0.13,
                                  width: width * 0.25,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: height * 0.14,
                            left: width * 0.28,
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 700),
                              opacity: fourth,
                              child: CustomPaint(
                                painter: TriangleCreator(),
                                child: Container(
                                  height: height * 0.13,
                                  width: width * 0.25,
                                ),
                              ),
                            ),
                          ),
                          ArrowElement(
                            id: '01',
                            targetId: '5',
                            sourceAnchor: Alignment.centerRight,
                            targetAnchor: Alignment.topCenter,
                            color: Colors.white,
                            flip: true,
                            child: ArrowElement(
                              id: '1',
                              targetId: '10',
                              sourceAnchor: Alignment.centerLeft,
                              targetAnchor: Alignment.topCenter,
                              color: Colors.white,
                              flip: true,
                              child: Positioned(
                                top: 0,
                                child: AnimatedContainer(
                                  child: Center(
                                    child: Text(
                                      '6',
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
                                      color: state == 100
                                          ? Colors.indigo
                                          : Colors.white,
                                      width: 3,
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
                                      '3',
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
                                      color: state == 1
                                          ? Colors.indigo
                                          : Colors.white,
                                      width: 3,
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
                                    '10',
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
                                      color: state == 2
                                          ? Colors.indigo
                                          : Colors.white,
                                      width: 3,
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
                                  color: Colors.orange,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: state == 1 || state == 3
                                        ? Colors.indigo
                                        : Colors.white,
                                    width: 3,
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
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: state == 1 || state == 4
                                        ? Colors.indigo
                                        : Colors.white,
                                    width: 3,
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
                                  '7',
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
                                    color: state == 2
                                        ? Colors.indigo
                                        : Colors.white,
                                    width: 3,
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
                                  '11',
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
                                    color: state == 2
                                        ? Colors.indigo
                                        : Colors.white,
                                    width: 3,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //4
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
