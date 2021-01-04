import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_arrows/arrows.dart';
import 'package:widget_arrows/widget_arrows.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';
import '../../../../constants.dart';


class DoublyInsertion extends StatefulWidget {
  @override
  _DoublyInsertionState createState() => _DoublyInsertionState();
}

class _DoublyInsertionState extends State<DoublyInsertion> {
  int currentState = -1;
  double firstChildOpacity=0, secondChildOpacity=1;

  double newArrowColor1 = 0, newArrowColor2 = 0;
  String newElementText = '',secondNext = 'third',thirdPrev = 'second';
  String headPointerTarget = 'first';
  Color newElementColor = Colors.transparent;
  AlignmentGeometry firstSourceFrontArrow = Alignment.centerRight;
  AlignmentGeometry firstTargetArrow = Alignment.centerLeft;
  AlignmentGeometry secondSourceFrontArrow = Alignment.centerRight;
  AlignmentGeometry secondTargetArrow = Alignment.centerLeft;
  AlignmentGeometry toNewElement = Alignment.centerLeft;
  AlignmentGeometry thirdPrevAlignment = Alignment.bottomRight;
  void forwardAnimation(){
    if(currentState == -1){
      firstChildOpacity = 1;
      secondChildOpacity = 0;
    }
    else if(currentState==0){
   //   print('hello world');
      headPointerTarget = 'second';
    }
    else if(currentState==1){
      newElementText = 'Data';
      newElementColor=Colors.red;
    }
    else if(currentState==2){
      secondNext = 'new';

  //    toNewElement = Alignment.centerRight;
      secondTargetArrow = Alignment.topRight;
      secondSourceFrontArrow = Alignment.bottomRight;
    }
    else if(currentState ==3){
      newArrowColor1 = 1;
    }
    else if(currentState ==4){
      thirdPrev = 'new';
      thirdPrevAlignment = Alignment.centerRight;
    }
    else if(currentState==5){
      newArrowColor2 = 1;

    }
    else return;

    currentState++;
  }
  void reverseAnimation(){
    if(currentState==1){
      headPointerTarget = 'first';
    }
    else if(currentState==2){
      newElementText = '';
      newElementColor=Colors.transparent;
    }
    else if(currentState ==3){
      secondNext = 'third';
      secondSourceFrontArrow = Alignment.centerRight;
      secondTargetArrow = Alignment.centerLeft;
    }
    else if(currentState ==4){
      newArrowColor1 = 0;

    }
    else if(currentState ==5){
      thirdPrev = 'second';
      thirdPrevAlignment = Alignment.bottomRight;
    }
    else if(currentState==6){
      newArrowColor2 = 0;

    }
    else if(currentState == 0){
      firstChildOpacity = 0;
      secondChildOpacity = 1;
    }
    else return;
    currentState--;
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    path = ['Home','DS','Linked List','Doubly','Insertion'];

    return WillPopScope(
      onWillPop: ()async{
        Navigator.pushNamedAndRemoveUntil(context, '/DoublyMainPage', (route) => false);

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
                        'Doubly Linked List Insertion',
                        style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white.withOpacity(firstChildOpacity)),
                      ),
                      SizedBox(
                        //height: height * 0.01,
                        //width: double.infinity,
                      ),
                      Row(
                        children: [
                          SizedBox(width: width * 0.073,),
                          ArrowElement(
                            id: 'headPointer',
                            targetId: headPointerTarget,
                            sourceAnchor: Alignment.bottomCenter,
                            targetAnchor: Alignment.topCenter,
                            color: Colors.white.withOpacity(firstChildOpacity),
                            child: Text(
                              'Head Pointer',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(firstChildOpacity),
                                  fontSize: height * 0.02
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.43,),
                          ArrowElement(
                            id: 'tailPointer',
                            targetId: 'third',
                            sourceAnchor: Alignment.bottomCenter,
                            targetAnchor: Alignment.topCenter,
                            color: Colors.white.withOpacity(firstChildOpacity),
                           // arcDirection: ArcDirection.Right,
                            child: Text(
                              'Tail Pointer',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(firstChildOpacity),
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
                            id: 'firstBack',
                            targetId: 'null1',
                            sourceAnchor: Alignment.bottomLeft,
                            targetAnchor: Alignment.centerLeft,
                            color: Colors.white.withOpacity(firstChildOpacity),
                         //   arcDirection: ArcDirection.Left,
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
                                        color: Colors.white.withOpacity(firstChildOpacity),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(firstChildOpacity),
                                  //borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          ArrowElement(
                            id: 'secondBack',
                            targetId: 'first',
                            color: Colors.white.withOpacity(firstChildOpacity),
                            sourceAnchor: Alignment.bottomLeft,
                            targetAnchor: Alignment.bottomRight,
                            child: ArrowElement(
                              id: 'second',
                              targetId: secondNext,
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
                                        color: Colors.white.withOpacity(firstChildOpacity),
                                        fontWeight: FontWeight.bold,

                                      ),
                                    )),
                                decoration: BoxDecoration(
                                  color: Colors.yellow.withOpacity(firstChildOpacity),
                                  //borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          ArrowElement(
                            id: 'thirdBack',
                            targetId: thirdPrev,
                            sourceAnchor: Alignment.bottomLeft,
                            targetAnchor: thirdPrevAlignment,
                            color: Colors.white.withOpacity(firstChildOpacity),
                            child: ArrowElement(
                              id: 'third',
                              targetId: 'null2',
                              sourceAnchor: Alignment.bottomRight,
                              targetAnchor: Alignment.centerRight,
                              color: Colors.white.withOpacity(firstChildOpacity),
                            //  arcDirection: ArcDirection.Right,
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                height: height * 0.05,
                                width: width * 0.2,
                                child: Center(
                                    child: Text(
                                      'Data',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(firstChildOpacity),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ArrowElement(
                            id: 'null1',
                            targetAnchor: Alignment.centerLeft,
                            color: Colors.white.withOpacity(firstChildOpacity),
                            child: Center(
                                child: Text(
                                  'Null',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(firstChildOpacity),
                                    fontWeight: FontWeight.bold,
                                    fontSize: height * 0.03,
                                  ),
                                )),
                          ),
                          ArrowElement(
                            id: 'new1',
                            targetId: 'third',
                            sourceAnchor: Alignment.bottomRight,
                            targetAnchor: Alignment.bottomCenter,
                            color: Colors.white.withOpacity(newArrowColor1),
                            child: ArrowElement(
                              id: 'new',
                              targetId: 'second',
                              targetAnchor: Alignment.bottomCenter,
                              sourceAnchor: Alignment.topCenter,
                              color: Colors.white.withOpacity(newArrowColor2),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                height: height * 0.05,
                                width: width * 0.2,
                                child: Center(
                                    child: Text(
                                      newElementText,
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(firstChildOpacity),
                                        fontWeight: FontWeight.bold,

                                      ),
                                    )),
                                decoration: BoxDecoration(
                                  color: newElementColor.withOpacity(firstChildOpacity),
                                  //borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          ArrowElement(
                            id: 'null2',
                            color: Colors.white.withOpacity(firstChildOpacity),
                            child: Center(
                                child: Text(
                                  'Null',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(firstChildOpacity),
                                    fontWeight: FontWeight.bold,
                                    fontSize: height * 0.03,
                                  ),
                                )),
                          ),
                        ],
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
      ),
    );
  }
}
