import 'package:flutter/material.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';

import 'package:dsa_simulation/src/constants.dart';
import 'package:dsa_simulation/src/Utilities/animation_helper.dart';
import 'package:dsa_simulation/src/Utilities/address_maninter.dart';
import 'package:dsa_simulation/src/Utilities/widgets.dart';

class QueueNavigator extends StatefulWidget {

  @override
  _QueueNavigatorState createState() => _QueueNavigatorState();
}

class _QueueNavigatorState extends State<QueueNavigator> with TickerProviderStateMixin{
  List toAdd = [4, 3, 2, 1], currentQueue = [];
  Color firstColor = Colors.transparent,
      secondColor = Colors.transparent,
      thirdColor = Colors.transparent,
      fourthColor = Colors.transparent;
  double firstPosition = 0,secondPosition = 0,thirdPosition = 0,fourthPosition = 0;
  double first = 1,second =1,third = 1,fourth = 1;
  double currentPosition = 4;
  AnimationController firstCon,secondCon,thirdCon,fourthCon;
  @override
  void initState() {
    // TODO: implement initState
    firstCon = AnimationController(vsync: this,duration: Duration(milliseconds: 500),);
    secondCon = AnimationController(vsync: this,duration: Duration(milliseconds: 500),);
    thirdCon = AnimationController(vsync: this,duration: Duration(milliseconds: 500),);
    fourthCon = AnimationController(vsync: this,duration: Duration(milliseconds: 500),);
    super.initState();
    firstCon.reset();
    secondCon.reset();
    thirdCon.reset();
    fourthCon.reset();
  }
  void enqueueAnimation(){
    if(currentQueue.length==4){
      return;
    }
    int toPush = toAdd[0];
    toAdd.remove(toPush);
    toAdd.add(toPush);
   // print(toPush);
    if(toPush==1){
      double here = currentPosition-first;
      firstPosition = 2*here;
      first = currentPosition;
      currentPosition--;
      firstColor = Colors.red;
  //    print(firstCon.value);
      firstCon.forward();

      firstPosition = 0;
      firstCon.reset();
      currentQueue.add(1);


    }
    else if(toPush==2){
      double here = currentPosition-second;
      secondPosition = 2*here;
      second = currentPosition;
      currentPosition--;
      secondColor = Colors.blue;
      secondCon.forward();
      secondPosition = 0;
      secondCon.reset();
      currentQueue.add(2);
    }
    else if(toPush==3){
      double here = currentPosition-third;
      thirdPosition = 2*here;
      third = currentPosition;
      currentPosition--;
      thirdColor = Colors.purple;
      thirdCon.forward();
      thirdPosition = 0;
      thirdCon.reset();
      currentQueue.add(3);
    }
    else if(toPush==4){
      double here = currentPosition-fourth;
      fourthPosition = 2*here;
      fourth = currentPosition;
      currentPosition--;
      print(fourthPosition);
      fourthColor = Colors.green;
      print(fourthCon.value);
      fourthCon.forward();
      print(fourthCon.value);
      fourthPosition = 0;
      //fourthCon.reset();
      currentQueue.add(4);
    }
  }

  void dequeueAnimation(){
     if(currentQueue.length==0)return;
     int toRem = currentQueue[0];
     for(int i=0;i<currentQueue.length;i++){
       if(currentQueue[i] ==1){
         first++;
         if(i==0)firstColor = Colors.transparent;
         firstPosition = 2;
         firstCon.forward();
         firstPosition = 0;
         firstCon.reset();
       }
       else if(currentQueue[i] ==2){
         second++;
         if(i==0)secondColor=Colors.transparent;
         secondPosition = 2;
         secondCon.forward();
         secondPosition = 0;
         secondCon.reset();
       }
       else if(currentQueue[i] ==3){
         third++;
         if(i==0)thirdColor=Colors.transparent;
         thirdPosition = 2;
         thirdCon.forward();
         thirdPosition=0;
         thirdCon.reset();
       }
       else if(currentQueue[i]==4){
         fourth++;
         if(i==0)fourthColor=Colors.transparent;
         fourthPosition=2;

         fourthCon.forward();
         fourthPosition =0;
         fourthCon.reset();
       }
     }
     currentPosition++;
     currentQueue.remove(toRem);

  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double h = height * 0.13, w = width * 0.1;

    return BaseTemplate(
      body: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              print("Start");
              print(fourthCon.value);
             // fourthCon.forward();
              print(fourthCon.value);
            });
          },
        ),
        appBar: appBar(context),
        body: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Queue',
                style: Theme.of(context).textTheme.headline6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Container(
                    height: height * 0.17,
                    width: width * 0.7,
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.white),
                        vertical: BorderSide.none,
                      ),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              AnimatedBuilder(animation: firstCon, builder:(context,_){
                                return Transform.translate(
                                  offset: Offset(firstPosition*firstCon.value,0),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    height: h,
                                    width: w,
                                    decoration: BoxDecoration(
                                      color: firstColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                );
                              },),
                              AnimatedBuilder(animation: secondCon, builder:(context,_){
                                return Transform.translate(
                                  offset: Offset(secondPosition*secondCon.value,0),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    height: h,
                                    width: w,
                                    decoration: BoxDecoration(
                                      color: secondColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                );
                              },),
                              AnimatedBuilder(animation: thirdCon, builder:(context,_){
                                return Transform.translate(
                                  offset: Offset(thirdPosition*thirdCon.value,0),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    height: h,
                                    width: w,
                                    decoration: BoxDecoration(
                                      color: thirdColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                );
                              },),
                              AnimatedBuilder(animation: fourthCon, builder:(context,_){
                                print(fourthPosition*fourthCon.value);
                                return Transform.translate(
                                  offset: Offset(fourthPosition*fourthCon.value,0),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    height: h,
                                    width: w,
                                    decoration: BoxDecoration(
                                      color: fourthColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                );
                              },),
                            ],
                          ),
                          SizedBox(width: w),
                          SizedBox(width: w),
                          SizedBox(width: w),
                          SizedBox(width: w),
                          SizedBox(width: w),
                          SizedBox(width: w),

                        ],
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
                        enqueueAnimation();
                      });
                    },
                    child: Text('enqueue'),
                    color: kThemeColor,
                  ),
                  RaisedButton(
                      onPressed: () {
                        setState(() {
                          dequeueAnimation();

                        });
                      },
                      child: Text('dequeue'),
                      color: kThemeColor),
                ],
              ),
              Container(
                height: height * 0.3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QueueElement extends StatefulWidget {
  Color color;
  double dx;
  AnimationController elementController;
  QueueElement({this.dx, this.color,this.elementController});
  @override
  _QueueElementState createState() => _QueueElementState();
}

class _QueueElementState extends State<QueueElement> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double h = height * 0.15, w = width * 0.1;

    return AnimatedBuilder(animation: widget.elementController, builder:(context,_){
      return Transform.translate(
        offset: Offset(widget.dx*widget.elementController.value,0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: h,
          width: w,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    },);
  }
}
