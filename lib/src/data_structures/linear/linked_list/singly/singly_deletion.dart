import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_arrows/widget_arrows.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';

import '../../../../constants.dart';

class SinglyDeletion extends StatefulWidget {
  @override
  _SinglyDeletionState createState() => _SinglyDeletionState();
}

class _SinglyDeletionState extends State<SinglyDeletion> {
  double arrowOpacity = 0;
  double firstChildOpacity = 0, secondChildOpacity = 1;
  double animationState = -1;
  double nullWidth = 0;
  double newElementOpacity = 0;
  String headPointerTargetId = 'first';
  String newElementTargetId = 'third';
  String secondTargetId = 'newElement';
  AlignmentGeometry secondElementArrow = Alignment.bottomRight;
  AlignmentGeometry headPointerArrow = Alignment.bottomCenter;

  void forward() {
    if (animationState == -1) {
      secondChildOpacity = 0;
      firstChildOpacity = 1;
      newElementOpacity = 1;
    } else if (animationState == 0) {
      headPointerArrow = Alignment.bottomRight;
      headPointerTargetId = 'second';
    } else if (animationState == 1) {
      secondElementArrow = Alignment.centerRight;
      secondTargetId = 'third';
    } else if (animationState == 2) newElementOpacity = 0;

    animationState++;
  }

  void reverse() {
    if (animationState == 3)
      newElementOpacity = 1;
    else if (animationState == 2) {
      secondElementArrow = Alignment.bottomRight;
      secondTargetId = 'newElement';
    } else if (animationState == 1) {
      headPointerArrow = Alignment.bottomCenter;
      headPointerTargetId = 'first';
    } else if (animationState == 0) {
      firstChildOpacity = 0;
      secondChildOpacity = 1;
      newElementOpacity = 0;
    }
    animationState--;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    path = ['Home', 'DS', 'Linked List', 'Singly', 'Deletion'];

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, '/SinglyMainPage', (route) => false);

        return true;
      },
      child: BaseTemplate(
        body: ArrowContainer(
          child: Scaffold(
            appBar: appBar(context),
            body: Stack(
              children: [
                Container(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Introduction to Singly Linked List',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(
                          //height: height * 0.01,
                          //width: double.infinity,
                          ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.07,
                          ),
                          ArrowElement(
                            id: 'headPointer',
                            targetId: headPointerTargetId,
                            sourceAnchor: headPointerArrow,
                            targetAnchor: Alignment.topCenter,
                            color: Colors.white.withOpacity(firstChildOpacity),
                            child: Text(
                              'Head Pointer',
                              style: TextStyle(
                                  color: Colors.white
                                      .withOpacity(firstChildOpacity),
                                  fontSize: height * 0.02),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.34,
                          ),
                          ArrowElement(
                            id: 'tailPointer',
                            targetId: 'third',
                            sourceAnchor: Alignment.bottomCenter,
                            targetAnchor: Alignment.topCenter,
                            color: Colors.white.withOpacity(firstChildOpacity),
                            child: Text(
                              'Tail Pointer',
                              style: TextStyle(
                                  color: Colors.white
                                      .withOpacity(firstChildOpacity),
                                  fontSize: height * 0.02),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ArrowElement(
                            id: 'first',
                            targetId: 'second',
                            sourceAnchor: Alignment.centerRight,
                            color: Colors.white.withOpacity(firstChildOpacity),
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              height: height * 0.05,
                              width: width * 0.2,
                              child: Center(
                                  child: Text(
                                'Data',
                                style: TextStyle(
                                  color: Colors.white
                                      .withOpacity(firstChildOpacity),
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                              decoration: BoxDecoration(
                                color:
                                    Colors.green.withOpacity(firstChildOpacity),
                                //borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          ArrowElement(
                            id: 'second',
                            targetId: secondTargetId,
                            sourceAnchor: secondElementArrow,
                            color: Colors.white.withOpacity(firstChildOpacity),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              height: height * 0.05,
                              width: width * 0.2,
                              child: Center(
                                  child: Text(
                                'Data',
                                style: TextStyle(
                                  color: Colors.white
                                      .withOpacity(firstChildOpacity),
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                              decoration: BoxDecoration(
                                color: Colors.yellow
                                    .withOpacity(firstChildOpacity),
                                //borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          ArrowElement(
                            id: 'third',
                            targetId: 'null',
                            sourceAnchor: Alignment.centerRight,
                            //targetAnchor: Alignment.topCenter,
                            color: Colors.white.withOpacity(firstChildOpacity),
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              height: height * 0.05,
                              width: width * 0.2,
                              child: Center(
                                  child: Text(
                                'Data',
                                style: TextStyle(
                                  color: Colors.white
                                      .withOpacity(firstChildOpacity),
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                              decoration: BoxDecoration(
                                color:
                                    Colors.cyan.withOpacity(firstChildOpacity),
                                //borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          ArrowElement(
                            id: 'null',
                            color: Colors.white.withOpacity(firstChildOpacity),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              height: height * 0.05,
                              width: width * 0.08,
                              child: Center(
                                  child: Text(
                                'Null',
                                style: TextStyle(
                                  color: Colors.white
                                      .withOpacity(firstChildOpacity),
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.6,
                            height: height * 0.1,
                          ),
                          ArrowElement(
                            id: 'newElement',
                            targetId: newElementTargetId,
                            sourceAnchor: Alignment.topCenter,
                            targetAnchor: Alignment.bottomCenter,
                            color: Colors.white.withOpacity(newElementOpacity),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              height: height * 0.05,
                              width: width * 0.2,
                              child: Center(
                                  child: Text(
                                'Data',
                                style: TextStyle(
                                  color: Colors.white
                                      .withOpacity(newElementOpacity),
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                              decoration: BoxDecoration(
                                color: Colors.lightGreen
                                    .withOpacity(newElementOpacity),
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
                Positioned(
                  right: width * 0.35,
                  top: height * 0.25,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: height * 0.05,
                    width: width * 0.3,
                    child: Center(
                      child: Text(
                        'Let\'s Dive',
                        style: TextStyle(
                            color: Colors.white.withOpacity(secondChildOpacity),
                            fontSize: height * 0.02),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(secondChildOpacity),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
