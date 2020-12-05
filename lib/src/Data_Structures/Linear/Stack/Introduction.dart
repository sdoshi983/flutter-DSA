import 'package:flutter/material.dart';

import '../../../constants.dart';

class StackIntroduction extends StatefulWidget {
  @override
  _StackIntroductionState createState() => _StackIntroductionState();
}

class _StackIntroductionState extends State<StackIntroduction> with SingleTickerProviderStateMixin {
  int currentState = 0;
  Color firstContainer = Colors.black;
  Color secondContainer = Colors.black;
  Color thirdContainer = Colors.black;

  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void forwardAnimation() {
    if (currentState == 0) {
      firstContainer = Colors.yellow;

    } else if (currentState == 1) {
      secondContainer = Colors.blueGrey;
    } else if (currentState == 2) {
      thirdContainer = Colors.green;
    }
   else{
      return;
    }
    currentState += 1;
    animationController.forward();
  }

  void reverseAnimation() {
    if (currentState == 1) {
      firstContainer = Colors.black;
    } else if (currentState == 2) {
      secondContainer = Colors.black;
    }
    else if(currentState ==3){
      thirdContainer = Colors.black;
    }
    else return;
    currentState -= 1;
    animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: height * 0.3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //color: Colors.white,
                width: width * 0.02,
                height: height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(width: width * 0.059,),
              Column(
                children: [
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(-2, -2),
                      end: Offset.zero,
                    ).animate(animationController),
                    child: Container(
                      width: width * 0.38,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        color: firstContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(-2, -2),
                      end: Offset.zero,
                    ).animate(animationController),
                    child: Container(
                      width: width * 0.38,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        color: secondContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(-2, -2),
                      end: Offset.zero,
                    ).animate(animationController),
                    child: Container(
                      width: width * 0.38,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        color: thirdContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(width: width * 0.059,),
              Container(
                width: width * 0.02,
                height: height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          Container(
            width: width * 0.54,
            height: height * 0.01,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
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
          )
        ],
      ),
    );
  }
}
