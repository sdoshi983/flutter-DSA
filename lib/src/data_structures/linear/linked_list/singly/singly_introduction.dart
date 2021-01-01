import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_arrows/widget_arrows.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';

import '../../../../constants.dart';

class SinglyIntroduction extends StatefulWidget {
  @override
  _SinglyIntroductionState createState() => _SinglyIntroductionState();
}

class _SinglyIntroductionState extends State<SinglyIntroduction> {
  double arrowOpacity = 0;
  double dataOpacity = 0;
  double firstChildOpacity=0, secondChildOpacity=1;
  double headPointerOpacity = 0, headPointerArrowOpacity = 0;
  double tailPointerOpacity = 0, tailPointerArrowOpacity = 0;
  double animationState = -1;
  double nullWidth = 0;

  
  void forward() {
    if(animationState == -1){
      firstChildOpacity = 1;
      secondChildOpacity = 0;
    }
    else if (animationState == 0)
      dataOpacity = 1;
    else if (animationState == 1){
      arrowOpacity = 1;
      nullWidth = 0.07;
    }
    else if(animationState == 2)
      headPointerOpacity = tailPointerOpacity = 1;
    else if(animationState == 3)
      headPointerArrowOpacity = 1;
    else if(animationState == 4)
      tailPointerArrowOpacity = 1;
    animationState++;
  }

  void reverse() {
    if(animationState == 5)
      tailPointerArrowOpacity = 0;
    else if(animationState == 4)
      headPointerArrowOpacity = 0;
    else if(animationState == 3)
      headPointerOpacity = tailPointerOpacity = 0;
    else if (animationState == 2) {
      arrowOpacity = 0;
      nullWidth = 0;
    }
    else if (animationState == 1) dataOpacity = 0;
    else if(animationState == 0){
      firstChildOpacity = 0;
      secondChildOpacity = 1;
    }
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
          body: Stack(
            children: [
              Container(
                height: height,
                width: width,
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Introduction to Singly Linked List',
                      style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
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
                          targetId: 'first',
                          sourceAnchor: Alignment.bottomCenter,
                          targetAnchor: Alignment.topCenter,
                          color: Colors.white.withOpacity(headPointerArrowOpacity),
                          child: Text(
                            'Head Pointer',
                            style: TextStyle(
                                color: Colors.white.withOpacity(headPointerOpacity),
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
                          color: Colors.white.withOpacity(tailPointerArrowOpacity),
                          child: Text(
                            'Tail Pointer',
                            style: TextStyle(
                                color: Colors.white.withOpacity(tailPointerOpacity),
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
                          color: Colors.white.withOpacity(arrowOpacity),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: height * 0.05,
                            width: width * 0.2,
                            child: Center(
                                child: Text(
                              'Data',
                              style: TextStyle(
                                color: Colors.white.withOpacity(dataOpacity),
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(firstChildOpacity),
                              //borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        ArrowElement(
                          id: 'second',
                          targetId: 'third',
                          sourceAnchor: Alignment.centerRight,
                          color: Colors.white.withOpacity(arrowOpacity),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            height: height * 0.05,
                            width: width * 0.2,
                            child: Center(
                                child: Text(
                              'Data',
                              style: TextStyle(
                                color: Colors.white.withOpacity(dataOpacity),
                                fontWeight: FontWeight.bold,

                              ),
                            )),
                            decoration: BoxDecoration(
                              color: Colors.yellow.withOpacity(firstChildOpacity),
                              //borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        ArrowElement(
                          id: 'third',
                          targetId: 'null',
                          sourceAnchor: Alignment.centerRight,
                          //targetAnchor: Alignment.topCenter,
                          color: Colors.white.withOpacity(arrowOpacity),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: height * 0.05,
                            width: width * 0.2,
                            child: Center(
                                child: Text(
                              'Data',
                              style: TextStyle(
                                color: Colors.white.withOpacity(dataOpacity),
                                fontWeight: FontWeight.bold,

                              ),
                            )),
                            decoration: BoxDecoration(
                              color: Colors.cyan.withOpacity(firstChildOpacity),
                              //borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        ArrowElement(
                          id: 'null',
                          color: Colors.white.withOpacity(arrowOpacity),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            height: height * 0.05,
                            width: width * nullWidth,
                            child: Center(
                                child: Text(
                                  'Null',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(arrowOpacity),
                                    fontWeight: FontWeight.bold,

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
                      style: TextStyle(color: Colors.white.withOpacity(secondChildOpacity), fontSize: height * 0.02),
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
    );
  }
}
