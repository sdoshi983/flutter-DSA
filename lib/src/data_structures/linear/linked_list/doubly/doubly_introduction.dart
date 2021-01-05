import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_arrows/arrows.dart';
import 'package:widget_arrows/widget_arrows.dart';

import '../../../../constants.dart';

class DoublyIntroduction extends StatefulWidget {
  @override
  _DoublyIntroductionState createState() => _DoublyIntroductionState();
}

class _DoublyIntroductionState extends State<DoublyIntroduction> {
  double arrowOpacity = 0;
  double firstChildOpacity = 0, secondChildOpacity = 1;
  double animationState = -1;
  double firstBackArrowOpacity = 0;
  double secondBackArrowOpacity = 0;
  double thirdBackArrowOpacity = 0;
  AlignmentGeometry firstSourceFrontArrow = Alignment.centerRight;
  AlignmentGeometry firstTargetArrow = Alignment.centerLeft;
  AlignmentGeometry secondSourceFrontArrow = Alignment.centerRight;
  AlignmentGeometry secondTargetArrow = Alignment.centerLeft;
  void forward() {
    if (animationState == -1) {
      firstChildOpacity = 1;
      secondChildOpacity = 0;
    } else if (animationState == 0)
      firstBackArrowOpacity = 1;
    else if (animationState == 1) {
      firstSourceFrontArrow = Alignment.topRight;
      firstTargetArrow = Alignment.topLeft;
      secondBackArrowOpacity = 1;
    } else if (animationState == 2) {
      secondSourceFrontArrow = Alignment.topRight;
      secondTargetArrow = Alignment.topLeft;
      thirdBackArrowOpacity = 1;
    }
    animationState++;
  }

  void reverse() {
    if (animationState == 3) {
      secondSourceFrontArrow = Alignment.centerRight;
      secondTargetArrow = Alignment.centerLeft;
      thirdBackArrowOpacity = 0;
    } else if (animationState == 2) {
      firstSourceFrontArrow = Alignment.centerRight;
      firstTargetArrow = Alignment.centerLeft;
      secondBackArrowOpacity = 0;
    } else if (animationState == 1) {
      firstBackArrowOpacity = 0;
    } else if (animationState == 0) {
      firstChildOpacity = 0;
      secondChildOpacity = 1;
    }
    animationState--;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ArrowContainer(
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
                    'Introduction to Doubly Linked List',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.white.withOpacity(firstChildOpacity)),
                  ),
                  SizedBox(
                      //height: height * 0.01,
                      //width: double.infinity,
                      ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.073,
                      ),
                      ArrowElement(
                        id: 'headPointer',
                        targetId: 'first',
                        sourceAnchor: Alignment.bottomCenter,
                        targetAnchor: Alignment.topCenter,
                        color: Colors.white.withOpacity(firstChildOpacity),
                        child: Text(
                          'Head Pointer',
                          style: TextStyle(
                              color:
                                  Colors.white.withOpacity(firstChildOpacity),
                              fontSize: height * 0.02),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.43,
                      ),
                      ArrowElement(
                        id: 'tailPointer',
                        targetId: 'third',
                        sourceAnchor: Alignment.bottomCenter,
                        targetAnchor: Alignment.topCenter,
                        color: Colors.white.withOpacity(firstChildOpacity),
                        arcDirection: ArcDirection.Right,
                        child: Text(
                          'Tail Pointer',
                          style: TextStyle(
                              color:
                                  Colors.white.withOpacity(firstChildOpacity),
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
                        id: 'firstBack',
                        targetId: 'null',
                        sourceAnchor: Alignment.bottomLeft,
                        targetAnchor: Alignment.centerLeft,
                        color: Colors.white.withOpacity(firstBackArrowOpacity),
                        arcDirection: ArcDirection.Left,
                        child: ArrowElement(
                          id: 'first',
                          targetId: 'second',
                          sourceAnchor: firstSourceFrontArrow,
                          targetAnchor: firstTargetArrow,
                          color: Colors.white.withOpacity(firstChildOpacity),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: height * 0.05,
                            width: width * 0.2,
                            child: Center(
                                child: Text(
                              'Data',
                              style: TextStyle(
                                color:
                                    Colors.white.withOpacity(firstChildOpacity),
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
                      ),
                      ArrowElement(
                        id: 'secondBack',
                        targetId: 'first',
                        color: Colors.white.withOpacity(secondBackArrowOpacity),
                        sourceAnchor: Alignment.bottomLeft,
                        targetAnchor: Alignment.bottomRight,
                        child: ArrowElement(
                          id: 'second',
                          targetId: 'third',
                          sourceAnchor: secondSourceFrontArrow,
                          targetAnchor: secondTargetArrow,
                          color: Colors.white.withOpacity(firstChildOpacity),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            height: height * 0.05,
                            width: width * 0.2,
                            child: Center(
                                child: Text(
                              'Data',
                              style: TextStyle(
                                color:
                                    Colors.white.withOpacity(firstChildOpacity),
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            decoration: BoxDecoration(
                              color:
                                  Colors.yellow.withOpacity(firstChildOpacity),
                              //borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      ArrowElement(
                        id: 'thirdBack',
                        targetId: 'second',
                        sourceAnchor: Alignment.bottomLeft,
                        targetAnchor: Alignment.bottomRight,
                        color: Colors.white.withOpacity(thirdBackArrowOpacity),
                        child: ArrowElement(
                          id: 'third',
                          targetId: 'null',
                          sourceAnchor: Alignment.bottomRight,
                          targetAnchor: Alignment.centerRight,
                          color: Colors.white.withOpacity(firstChildOpacity),
                          arcDirection: ArcDirection.Right,
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: height * 0.05,
                            width: width * 0.2,
                            child: Center(
                                child: Text(
                              'Data',
                              style: TextStyle(
                                color:
                                    Colors.white.withOpacity(firstChildOpacity),
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            decoration: BoxDecoration(
                              color: Colors.cyan.withOpacity(firstChildOpacity),
                              //borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.45,
                        height: height * 0.1,
                      ),
                      ArrowElement(
                        id: 'null',
                        color: Colors.white.withOpacity(firstChildOpacity),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          height: height * 0.05,
                          width: width * 0.1,
                          child: Center(
                              child: Text(
                            'Null',
                            style: TextStyle(
                              color:
                                  Colors.white.withOpacity(firstChildOpacity),
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.03,
                            ),
                          )),
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
    );
  }
}
