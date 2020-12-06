import 'package:flutter/material.dart';

import '../../../constants.dart';

class StackIntroduction extends StatefulWidget {
  @override
  _StackIntroductionState createState() => _StackIntroductionState();
}

class _StackIntroductionState extends State<StackIntroduction> with TickerProviderStateMixin {
  int currentState = 0;
  Color firstContainer = Colors.black;
  Color secondContainer = Colors.black;
  Color thirdContainer = Colors.black;

  AnimationController firstController, secondController, thirdController;

  @override
  void initState() {
    super.initState();
    firstController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    secondController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    thirdController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    super.dispose();
  }

  void forwardAnimation() {
    if (currentState == 0) {
      thirdContainer = Colors.green;
      thirdController.forward();

    } else if (currentState == 1) {
      secondContainer = Colors.blueGrey;
      secondController.forward();

    } else if (currentState == 2) {
      firstContainer = Colors.yellow;
      firstController.forward();

    }
   else{
      return;
    }
    currentState += 1;
  }

  void reverseAnimation() {
    if (currentState == 1) {
      thirdController.reverse();
      thirdContainer = Colors.black;

    } else if (currentState == 2) {
      secondController.reverse();

      secondContainer = Colors.black;
    }
    else if(currentState ==3){
      firstController.reverse();

      firstContainer = Colors.black;
    }
    else return;
    currentState -= 1;
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
                      begin: Offset(0, -2),
                      end: Offset.zero,
                    ).animate(firstController),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
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
                      begin: Offset(0, -2),
                      end: Offset.zero,
                    ).animate(secondController),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),

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
                      begin: Offset(0, -2),
                      end: Offset.zero,
                    ).animate(thirdController),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),

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
                child: Text("Pop", style: TextStyle(color: Colors.white),),
                color: kThemeColor,
              ),
              RaisedButton(
                  onPressed: () {
                    setState(() {
                      forwardAnimation();
                    });
                  },
                  child: Text("Push", style: TextStyle(color: Colors.white),),
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
