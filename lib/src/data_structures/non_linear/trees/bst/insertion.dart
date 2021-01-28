import 'package:flutter/material.dart';

import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';
import 'package:dsa_simulation/src/utilities/triangle_creator.dart';
import 'package:dsa_simulation/src/utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:widget_arrows/arrows.dart';
import 'package:widget_arrows/widget_arrows.dart';

import '../../../../constants.dart';
import '../tree_introduction.dart';

class Position {
  double x, y;
  Position({this.x, this.y});
}

class BstInsertion extends StatefulWidget {
  @override
  _BstInsertionState createState() => _BstInsertionState();
}

class _BstInsertionState extends State<BstInsertion> {
  double tipLength = 5;
  int state = 0;
  Color startColor = Colors.transparent;
  Position first = Position(x: 0.5, y: 0.1 / 6),
      second = Position(x: 0.5, y: 1.1 / 6),
      third = Position(x: 0.5, y: 2.1 / 6),
      fourth = Position(x: 0.5, y: 3.1 / 6),
      fifth = Position(x: 0.5, y: 4.1 / 6),sixth = Position(x:0.5,y:5.1/6);

  void forward() {
    if (state == 0) {
    } else if (state == 1) {
      first.x = 0;
      first.y = 0.44;
    } else if (state == 2) {
      second.x = 0.05;
      second.y = 0.44;
    } else if (state == 3) {
      second.x = 0.1;
      second.y = 0.63;
    } else if (state == 4) {
      third.x = 0.05;
      third.y = 0.44;
    } else if (state == 5) {
      third.x = 0.15;
      third.y = 0.63;
    } else if (state == 6) {
      third.x = 0.2;
      third.y = 0.53;
    } else if (state == 7) {
      fourth.x = 0.05;
      fourth.y = 0.44;
    } else if (state == 8) {
      fourth.x = 0.1;
      fourth.y = 0.25;
    }else if(state==9){
      fifth.x = 0.05;fifth.y=0.44;
    }
    else if(state==10){
      fifth.x = 0.15;fifth.y = 0.25;
    }
  else if(state==11){
    fifth.x = 0.2;fifth.y = 0.35;
    }
  else if(state==12){
    sixth.x = 0.2;sixth.y = 0.15;
    }
    else
      return;
    state++;
  }

  void reverse() {
    if (state == 1) {
    }else if(state==13){
      sixth.x = 0.5;sixth.y = 5.1/6;
    }
    else if(state==12){
      fifth.x = 0.15;fifth.y=0.25;
    }
    else if(state==11){
      fifth.x=0.05;fifth.y=0.44;
    }
    else if(state==10){
      fifth.x=0.5;fifth.y = 4.1/6;
    }
    else if (state == 9) {
      fourth.x = 0.05;
      fourth.y = 0.44;
    } else if (state == 8) {
      fourth.x = 0.5;
      fourth.y = 3.1 / 6;
    } else if (state == 7) {
      third.x = 0.15;
      third.y = 0.63;
    } else if (state == 6) {
      third.x = 0.05;
      third.y = 0.44;
    } else if (state == 2) {
      first.x = 0.5;
      first.y = 0.1 / 6;
    } else if (state == 3) {
      second.x = 0.5;
      second.y = 1.1 / 6;
    } else if (state == 4) {
      second.x = 0.05;
      second.y = 0.44;
    } else if (state == 5) {
      third.x = 0.5;
      third.y = 2.1 / 6;
    } else
      return;
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
                          ArrowElement(
                            id: '01',
                            targetId: '5',
                            sourceAnchor: Alignment.centerRight,
                            targetAnchor: Alignment.topCenter,
                            color:
                                state > 3 ? Colors.white : Colors.transparent,
                            flip: true,
                            child: ArrowElement(
                              id: '1',
                              targetId: '10',
                              sourceAnchor: Alignment.centerLeft,
                              targetAnchor: Alignment.topCenter,
                              color:
                                  state > 8 ? Colors.white : Colors.transparent,
                              flip: true,
                              child: Positioned(
                                top: 0,
                                child: Node(
                                  text: '6',
                                  color: startColor,
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
                            color: state>11?Colors.white:Colors.transparent,
                            flip: true,
                            child: ArrowElement(
                              id: '10',
                              targetId: '7',
                              sourceAnchor: Alignment.centerLeft,
                              targetAnchor: Alignment.topCenter,
                              color: state>12?Colors.white:Colors.transparent,
                              flip: true,
                              child: Positioned(
                                  top: height * 0.1,
                                  left: width * 0.25,
                                  child: Node(text: '3', color: startColor)),
                            ),
                          ),
                          //10
                          ArrowElement(
                            id: '5',
                            targetId: '0',
                            sourceAnchor: Alignment.centerLeft,
                            targetAnchor: Alignment.topCenter,
                            color:
                                state > 6 ? Colors.white : Colors.transparent,
                            flip: true,
                            child: Positioned(
                              top: height * 0.1,
                              right: width * 0.25,
                              child: Node(text: '10', color: startColor),
                            ),
                          ),
                          //5
                          ArrowElement(
                            id: '7',
                            child: Positioned(
                              top: height * 0.2,
                              left: width * 0.15,
                              child: Node(text: '1', color: startColor),
                            ),
                          ),
                          //7
                          ArrowElement(
                            id: '2',
                            child: Positioned(
                              top: height * 0.2,
                              left: width * 0.35,
                              child: Node(text: '4', color: startColor),
                            ),
                          ),
                          //2

                          ArrowElement(
                            id: '0',
                            child: Positioned(
                              top: height * 0.2,
                              right: width * 0.35,
                              child: Node(text: '7', color: startColor),
                            ),
                          ),
                          //0

                          AnimatedPositioned(
                            duration: Duration(milliseconds: 600),
                            top: height * 0.5,
                            left: state == 0 ? 0 : width * (5.1 / 6),
                            child: Node(
                              text: '1',
                              color: Colors.grey,
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 600),
                            top: height * 0.5,
                            left: state == 0 ? 0 : width * (0.1 / 6),
                            child: Node(
                              text: '6',
                              color: Colors.grey,
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 600),
                            top: height * 0.5,
                            left: state == 0 ? 0 : width * (1.1 / 6),
                            child: Node(
                              text: '10',
                              color: Colors.grey,
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 600),
                            top: height * 0.5,
                            left: state == 0 ? 0 : width * (2.1 / 6),
                            child: Node(
                              text: '7',
                              color: Colors.grey,
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 600),
                            top: height * 0.5,
                            left: state == 0 ? 0 : width * (3.1 / 6),
                            child: Node(
                              text: '3',
                              color: Colors.grey,
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 600),
                            top: height * 0.5,
                            left: state == 0 ? 0 : width * (4.1 / 6),
                            child: Node(
                              text: '4',
                              color: Colors.grey,
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 600),
                            top: height * first.x,
                            left: state == 0 ? 0 : width * first.y,
                            child: Node(
                              text: '6',
                              color: Colors.red,
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 600),
                            top: height * second.x,
                            left: state == 0 ? 0 : width * (second.y),
                            child: Node(
                              text: '10',
                              color: Colors.cyan,
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 600),
                            top: height * third.x,
                            left: state == 0 ? 0 : width * third.y,
                            child: Node(
                              text: '7',
                              color: Colors.purple,
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 600),
                            top: height * fourth.x,
                            left: state == 0 ? 0 : width * fourth.y,
                            child: Node(
                              text: '3',
                              color: Colors.blue,
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 600),
                            top: height * fifth.x,
                            left: state == 0 ? 0 : width * fifth.y,
                            child: Node(
                              text: '4',
                              color: Colors.green,
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 600),
                            top: height * sixth.x,
                            left: state == 0 ? 0 : width * sixth.y,
                            child: Node(
                              text: '1',
                              color: Colors.orange,
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

class Node extends StatefulWidget {
  String text;
  Color color;
  Node({this.text, this.color});
  @override
  _NodeState createState() => _NodeState();
}

class _NodeState extends State<Node> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      child: Center(
          child: Text(
        widget.color==Colors.transparent?' ':widget.text,
        style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: Colors.white,
            ),
      )),
      duration: Duration(milliseconds: 500),
      height: width * 0.12,
      width: width * 0.12,
      decoration: BoxDecoration(
        color: widget.color,
        shape: BoxShape.circle,
        border: Border.all(
          color: widget.color==Colors.transparent?Colors.transparent:Colors.white,
          width: 3,
        ),
      ),
    );
  }
}
