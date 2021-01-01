import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:flutter/material.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';

import 'package:dsa_simulation/src/constants.dart';
import 'package:dsa_simulation/src/Utilities/address_maninter.dart' as add;
import 'package:dsa_simulation/src/Utilities/widgets.dart';

class QueueNavigator extends StatefulWidget {
  @override
  _QueueNavigatorState createState() => _QueueNavigatorState();
}

class _QueueNavigatorState extends State<QueueNavigator>
    with TickerProviderStateMixin {
  int container = 300,slide = 500;
  List toAdd = [4, 3, 2, 1], currentQueue = [];
  Color firstColor = Colors.transparent,
      secondColor = Colors.transparent,
      thirdColor = Colors.transparent,
      fourthColor = Colors.transparent;
  double firstFac = 0,secondFac=0,thirdFac = 0,fourthFac = 0;
  double required = 6;
  int last = -1;
  void enqueueAnimation() {
    if(last==1){
      firstFac=0;
    }
    else if(last==2)secondFac=0;
    else if(last==3)thirdFac=0;
    else if(last==4) fourthFac=0;
    last = -1;
    if(currentQueue.length==4)return;
    int here = toAdd[0];
    toAdd.remove(here);
    toAdd.add(here);
    currentQueue.add(here);
    if(here ==4){
      fourthColor = Colors.red;
      fourthFac = required;
    }
    else if(here ==3){
      thirdColor=Colors.blue;
      thirdFac=required;
    }
    else if(here ==2){
      secondColor = Colors.green;
      secondFac = required;
    }
    else if(here == 1){
      firstColor = Colors.yellow;
      firstFac = required;
    }
    required-=2;

  }

  void dequeueAnimation() {
    if(last==1){
      firstFac=0;
    }
    else if(last==2)secondFac=0;
    else if(last==3)thirdFac=0;
    else if(last==4) fourthFac=0;
    last = -1;
    if(currentQueue.length==0)return;
    int here = currentQueue[0];
    for(int i=0;i<currentQueue.length;i++){
      if(currentQueue[i] ==1){
        if(i==0)firstColor=Colors.transparent;
        firstFac+=2;
      }
      else if(currentQueue[i]==2){
        if(i==0)secondColor=Colors.transparent;

        secondFac+=2;
      }
      else if(currentQueue[i] ==3){
        if(i==0)thirdColor=Colors.transparent;

        thirdFac+=2;
      }
      else if(currentQueue[i]==4){
        if(i==0)fourthColor=Colors.transparent;

        fourthFac+=2;
      }
    }
    last=here;
    required+=2;
    currentQueue.remove(here);
  }

  @override
  Widget build(BuildContext context) {
  //  print('Inside build');
    add.path = ['Home','DS','Queue'];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double h = height * 0.13, w = width * 0.1;

    return WillPopScope(
      onWillPop: ()async{
        Navigator.pushNamedAndRemoveUntil(context, '/LinearNonLinearPage', (route) => false);

        return true;
      },
      child: BaseTemplate(
        body: Scaffold(
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
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                top: 6,
                                left: w*firstFac,
                                child: QueueElement(
                                  color: firstColor,
                                ),
                                duration: Duration(
                                  milliseconds: slide,
                                ),
                              ),
                              AnimatedPositioned(
                                top: 6,
                                left: secondFac * w,
                                child: QueueElement(
                                  color: secondColor,
                                ),
                                duration: Duration(
                                  milliseconds: slide,
                                ),
                              ),
                              AnimatedPositioned(
                                top: 6,
                                left: thirdFac * w,
                                child: QueueElement(
                                  color: thirdColor,
                                ),
                                duration: Duration(
                                  milliseconds:slide,
                                ),
                              ),
                              AnimatedPositioned(
                                top: 6,
                                left: fourthFac* w,
                                child: QueueElement(
                                  color: fourthColor,
                                ),
                                duration: Duration(
                                  milliseconds: slide,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        setState(() {
             //             print('clicked');
                          enqueueAnimation();
                          //print(firstCon.value);
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
      ),
    );
  }
}

class QueueElement extends StatefulWidget {
  Color color;
  QueueElement({
    this.color,
  });
  @override
  _QueueElementState createState() => _QueueElementState();
}

class _QueueElementState extends State<QueueElement> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double h = height * 0.15, w = width * 0.1;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: h,
      width: w,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
