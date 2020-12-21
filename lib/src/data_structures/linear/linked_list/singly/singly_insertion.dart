import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_arrows/widget_arrows.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';

import '../../../../constants.dart';

class SinglyInsertion extends StatefulWidget {
  @override
  _SinglyInsertionState createState() => _SinglyInsertionState();
}

class _SinglyInsertionState extends State<SinglyInsertion> {
  double arrowOpacity = 0;

  double animationState = 0;
  double nullWidth = 0;
  double newElementOpacity = 0;
  String headPointerTargetId = 'first';
  String newElementTargetId = '';
  String secondTargetId = 'third';
  AlignmentGeometry secondElementArrow = Alignment.centerRight;
  AlignmentGeometry headPointerArrow = Alignment.bottomCenter;

  void forward() {
    if(animationState == 0)
      newElementOpacity = 1;
    else if(animationState == 1) {
      headPointerArrow = Alignment.bottomRight;
      headPointerTargetId = 'second';
    }
    else if(animationState == 2)
      newElementTargetId = 'third';
    else if(animationState == 3) {
      secondElementArrow = Alignment.bottomRight;
      secondTargetId = 'newElement';
    }
    animationState++;
  }

  void reverse() {
    if(animationState == 4) {
      secondElementArrow = Alignment.centerRight;
      secondTargetId = 'third';
    }
    else if(animationState == 3)
      newElementTargetId = '';
    else if(animationState == 2) {
      headPointerArrow = Alignment.bottomCenter;
      headPointerTargetId = 'first';
    }
    else if (animationState == 1)
      newElementOpacity = 0;

    animationState--;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BaseTemplate(
      body: ArrowContainer(
        child: Scaffold(
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
                SizedBox(
                  //height: height * 0.01,
                  //width: double.infinity,
                ),
                Row(
                  children: [
                    SizedBox(width: width * 0.07,),
                    ArrowElement(
                      id: 'headPointer',
                      targetId: headPointerTargetId,
                      sourceAnchor: headPointerArrow,
                      targetAnchor: Alignment.topCenter,
                      color: Colors.white,
                      child: Text(
                        'Head Pointer',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: height * 0.02
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.34,),
                    ArrowElement(
                      id: 'tailPointer',
                      targetId: 'third',
                      sourceAnchor: Alignment.bottomCenter,
                      targetAnchor: Alignment.topCenter,
                      color: Colors.white,
                      child: Text(
                        'Tail Pointer',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: height * 0.02
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ArrowElement(
                      id: 'first',
                      targetId: 'second',
                      sourceAnchor: Alignment.centerRight,
                      color: Colors.white,
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: height * 0.05,
                        width: width * 0.2,
                        child: Center(
                            child: Text(
                              'Data',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          //borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    ArrowElement(
                      id: 'second',
                      targetId: secondTargetId,
                      sourceAnchor: secondElementArrow,
                      color: Colors.white,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: height * 0.05,
                        width: width * 0.2,
                        child: Center(
                            child: Text(
                              'Data',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,

                              ),
                            )),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          //borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    ArrowElement(
                      id: 'third',
                      targetId: 'null',
                      sourceAnchor: Alignment.centerRight,
                      //targetAnchor: Alignment.topCenter,
                      color: Colors.white,
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: height * 0.05,
                        width: width * 0.2,
                        child: Center(
                            child: Text(
                              'Data',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,

                              ),
                            )),
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          //borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    ArrowElement(
                      id: 'null',
                      color: Colors.white,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        height: height * 0.05,
                        width: width * 0.08,
                        child: Center(
                            child: Text(
                              'Null',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,

                              ),
                            )),

                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: width * 0.6, height: height * 0.1,),
                    ArrowElement(
                      id: 'newElement',
                      targetId: newElementTargetId,
                      sourceAnchor: Alignment.topCenter,
                      targetAnchor: Alignment.bottomCenter,
                      color: Colors.white,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        height: height * 0.05,
                        width: width * 0.2,
                        child: Center(
                            child: Text(
                              'Data',
                              style: TextStyle(
                                color: Colors.white.withOpacity(newElementOpacity),
                                fontWeight: FontWeight.bold,

                              ),
                            )),
                        decoration: BoxDecoration(
                          color: Colors.lightGreen.withOpacity(newElementOpacity),
                          //borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
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
        ),
      ),
    );
  }
}
