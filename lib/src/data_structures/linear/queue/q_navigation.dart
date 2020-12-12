import 'package:flutter/material.dart';

import 'package:dsa_simulation/src/constants.dart';
import 'package:dsa_simulation/src/Utilities/animation_helper.dart';
import 'package:dsa_simulation/src/Utilities/address_maninter.dart';
import 'package:dsa_simulation/src/Utilities/widgets.dart';

class QNavigator extends StatefulWidget {
  @override
  _QNavigatorState createState() => _QNavigatorState();
}

class _QNavigatorState extends State<QNavigator> with TickerProviderStateMixin {
  List toRemove = [4,3,2,1];
  List toInsert = [4,3,2,1];
  int currentSize = 0, head = -1, tail = 4;
  GlobalKey _keyFirst = GlobalKey(),
      _keySecond = GlobalKey(),
      _keyThird = GlobalKey(),
      _keyFourth = GlobalKey(),
      _keyStart = GlobalKey();
  Color _firstColor = Colors.transparent,
      _secondColor = Colors.transparent,
      _thirdColor = Colors.transparent,
      _fourthColor = Colors.transparent;
  String _firstText = ' ',
      _secondText = ' ',
      _thirdText = ' ',
      _fourthText = ' ';
  AnimationController _firstController,
      _secondController,
      _thirdController,
      _fourthController,
      _allAheadController;
  Animation<Offset> _firstTween,
      _secondTween,
      _thirdTween,
      _fourthTween,
      _firstAheadTween,_secondAheadTween,_thirdAheadTween,_fourthAheadTween,_allAheadTween;
  double currentAheadOffset = 0;
  Size _elementSize = Size(0.1, 0.13);
  bool isCalculated = false;
  Offset _fourthElementPosition = Offset(0, 0),
      _thirdElementPosition = Offset(0, 0),
      _oneMoveOffset,
      _startingPoint,
      _nextElementPosition = Offset(0, 0),
      _currentElementPosition = Offset(0, 0);
  double positionRequired = 0;
  @override
  void dispose() {
    //TODO : Dump Animation Controller
    removeLast();
    super.dispose();
  }

  @override
  void initState() {
    _firstController = AnimationController(
      duration: Duration(
        milliseconds: 800,
      ),
      vsync: this,
    );
    _allAheadController = AnimationController(
      duration: Duration(
        milliseconds: 800,
      ),
      vsync: this,
    );
    _secondController = AnimationController(
      duration: Duration(
        milliseconds: 800,
      ),
      vsync: this,
    );
    _thirdController = AnimationController(
      duration: Duration(
        milliseconds: 800,
      ),
      vsync: this,
    );
    _allAheadTween =
        Tween<Offset>(begin: Offset.zero, end: Offset.zero).animate(
          CurvedAnimation(
            parent: _allAheadController,
            curve: Curves.ease,
          ),
        );
    _fourthController = AnimationController(
      duration: Duration(
        milliseconds: 800,
      ),
      vsync: this,
    );
    _firstTween = Tween<Offset>(begin: Offset.zero, end: Offset.zero).animate(
      CurvedAnimation(
        parent: _fourthController,
        curve: Curves.ease,
      ),
    );
    _firstAheadTween =
        Tween<Offset>(begin: Offset.zero, end: Offset.zero).animate(
      CurvedAnimation(
        parent: _allAheadController,
        curve: Curves.ease,
      ),
    );
    _secondAheadTween =
        Tween<Offset>(begin: Offset.zero, end: Offset.zero).animate(
          CurvedAnimation(
            parent: _allAheadController,
            curve: Curves.ease,
          ),
        );
    _thirdAheadTween =
        Tween<Offset>(begin: Offset.zero, end: Offset.zero).animate(
          CurvedAnimation(
            parent: _allAheadController,
            curve: Curves.ease,
          ),
        );
    _fourthAheadTween =
        Tween<Offset>(begin: Offset.zero, end: Offset.zero).animate(
          CurvedAnimation(
            parent: _allAheadController,
            curve: Curves.ease,
          ),
        );
    _secondTween = Tween<Offset>(begin: Offset.zero, end: Offset.zero).animate(
      CurvedAnimation(
        parent: _fourthController,
        curve: Curves.ease,
      ),
    );
    _thirdTween = Tween<Offset>(begin: Offset.zero, end: Offset.zero).animate(
      CurvedAnimation(
        parent: _fourthController,
        curve: Curves.ease,
      ),
    );
    _fourthTween = Tween<Offset>(begin: Offset.zero, end: Offset.zero).animate(
      CurvedAnimation(
        parent: _fourthController,
        curve: Curves.ease,
      ),
    );

    super.initState();
  }
  // 259.20000000000005
  // 204.21818181818185
  // 149.23636363636365
  // 94.25454545454545
// ---- // 39.27272727272725

  void forwardAnimation() {
    if(currentSize>=4)return;
    if (!isCalculated) {
      isCalculated = true;
      _elementSize = getSizes(_keyFirst);
      _fourthElementPosition = getPositions(_keyFourth);
      _thirdElementPosition = getPositions(_keyThird);
      positionRequired = _fourthElementPosition.dx;
      _startingPoint = getPositions(_keyStart);
      double dx = _fourthElementPosition.dx - _thirdElementPosition.dx;

      _oneMoveOffset = Offset(dx, 0);
    }
    if (toInsert[0]==4) {
      _fourthController.reset();
      _fourthColor = Colors.red;

      _currentElementPosition = getPositions(_keyFourth);
      double forInitial =
          (_startingPoint.dx - _currentElementPosition.dx) / _elementSize.width;
      double forFinal =
          (positionRequired - _currentElementPosition.dx) / _elementSize.width;
      Offset initialOffset = Offset(forInitial, 0),
          finalOffset = Offset(forFinal, 0);
      _fourthTween =
          Tween<Offset>(begin: initialOffset, end: finalOffset).animate(
        CurvedAnimation(
          parent: _fourthController,
          curve: Curves.ease,
        ),
      );
      _fourthController.forward();
      tail -= 1;
      head = 1;
      positionRequired -= _oneMoveOffset.dx;
      currentSize += 1;
      toInsert.remove(4);
      toInsert.add(4);
    } else if (toInsert[0]==3) {
      _thirdController.reset();
      _thirdColor = Colors.blue;
      _currentElementPosition = getPositions(_keyThird);
      double forInitial = (_startingPoint.dx - _currentElementPosition.dx) /
          (_elementSize.width);
      double forFinal =
          (positionRequired - _currentElementPosition.dx) / _elementSize.width;
      Offset initialOffset = Offset(forInitial, 0),
          finalOffset = Offset(forFinal, 0);
      _thirdTween =
          Tween<Offset>(begin: initialOffset, end: finalOffset).animate(
        CurvedAnimation(
          parent: _thirdController,
          curve: Curves.ease,
        ),
      );
      _thirdController.forward();

      positionRequired -= _oneMoveOffset.dx;
      currentSize += 1;
      toInsert.remove(3);
      toInsert.add(3);
    } else if (toInsert[0]==2) {
      _secondController.reset();
      _secondColor = Colors.green;
      _currentElementPosition = getPositions(_keySecond);
      double forInitial = (_startingPoint.dx - _currentElementPosition.dx) /
          (_elementSize.width);
      double forFinal =
          (positionRequired - _currentElementPosition.dx) / _elementSize.width;
      Offset initialOffset = Offset(forInitial, 0),
          finalOffset = Offset(forFinal, 0);
      _secondTween =
          Tween<Offset>(begin: initialOffset, end: finalOffset).animate(
        CurvedAnimation(
          parent: _secondController,
          curve: Curves.ease,
        ),
      );
      _secondController.forward();
      tail -= 1;
      positionRequired -= _oneMoveOffset.dx;
      currentSize += 1;
      toInsert.remove(2);toInsert.add(2);
    } else if (toInsert[0] == 1) {
      _firstController.reset();
      _firstColor = Colors.pink;

      _currentElementPosition = getPositions(_keyFirst);
      double forInitial = (_startingPoint.dx - _currentElementPosition.dx) /
          (_elementSize.width);
      double forFinal =
          (positionRequired - _currentElementPosition.dx) / _elementSize.width;
      Offset initialOffset = Offset(forInitial, 0),
          finalOffset = Offset(forFinal, 0);
      _firstTween =
          Tween<Offset>(begin: initialOffset, end: finalOffset).animate(
        CurvedAnimation(
          parent: _firstController,
          curve: Curves.ease,
        ),
      );
      _firstController.forward();
      tail -= 1;
      positionRequired -= _oneMoveOffset.dx;
      currentSize += 1;
      toInsert.remove(1);toInsert.add(1);
    }
    print('${_startingPoint.dx}');


  }

  void reverseAnimation() {
    if (currentSize <= 0) return;
    _allAheadController.reset();
    if (toRemove[0]==4) {
      positionRequired += _oneMoveOffset.dx;
      _fourthColor = Colors.transparent;
      _allAheadTween =
          Tween<Offset>(begin: Offset(currentAheadOffset,0), end: Offset(currentAheadOffset+(_oneMoveOffset.dx/_elementSize.width), 0))
              .animate(
        CurvedAnimation(
          parent: _allAheadController,
          curve: Curves.ease,
        ),
      );
      currentAheadOffset+=_oneMoveOffset.dx/_elementSize.width;
      currentSize -= 1;
      _allAheadController.forward();

      toRemove.remove(4);toRemove.add(4);
    } else if (toRemove[0]==3) {
    //  print(2222);
      positionRequired += _oneMoveOffset.dx;
      _thirdColor = Colors.transparent;
      _allAheadTween =
          Tween<Offset>(begin: Offset(currentAheadOffset,0), end: Offset(currentAheadOffset+(_oneMoveOffset.dx/_elementSize.width), 0))
              .animate(
        CurvedAnimation(
          parent: _allAheadController,
          curve: Curves.ease,
        ),
      );
      currentAheadOffset+=_oneMoveOffset.dx/_elementSize.width;

      _allAheadController.forward();
      currentSize -= 1;
      toRemove.remove(3);toRemove.add(3);

    } else if (toRemove[0] == 2) {
      _secondColor = Colors.transparent;
      positionRequired += _oneMoveOffset.dx;

      _allAheadTween =
          Tween<Offset>(begin: Offset(currentAheadOffset,0), end: Offset(currentAheadOffset+(_oneMoveOffset.dx/_elementSize.width), 0))
              .animate(
            CurvedAnimation(
              parent: _allAheadController,
              curve: Curves.ease,
            ),
          );
      currentAheadOffset+=_oneMoveOffset.dx/_elementSize.width;
      _allAheadController.forward();
      currentSize -= 1;
      toRemove.remove(2);toRemove.add(2);
    }
    else if(toRemove[0] ==1){
      _firstColor=Colors.transparent;
      positionRequired+=_oneMoveOffset.dx;
      _allAheadTween = Tween<Offset>(begin:Offset(currentAheadOffset,0),end:Offset(currentAheadOffset+(_oneMoveOffset.dx/_elementSize.width),0)).animate(CurvedAnimation(parent: _allAheadController,curve: Curves.ease,),);
      _allAheadController.forward();
      currentSize-=1;
      toRemove.remove(1);toRemove.add(1);
      currentAheadOffset+=_oneMoveOffset.dx/_elementSize.width;
    }

  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
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
                AnimatedContainer(
                  key: _keyStart,
                  width: width * 0.1,
                  height: height * 0.13,
                  child: Center(
                    child: Text(
                      'S',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  duration: Duration(milliseconds: 800),
                  curve: Curves.ease,
                ),
                Container(
                  height: height * 0.15,
                  width: width * 0.6,
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.white),
                      vertical: BorderSide.none,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SlideTransition(
                        child: SlideTransition(
                          position: _allAheadTween,
                          child: AnimatedContainer(
                            key: _keyFirst,
                            width: width * 0.1,
                            height: height * 0.13,
                            child: Center(
                              child: Text(
                                _firstText,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: _firstColor,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            duration: Duration(milliseconds: 800),
                            curve: Curves.ease,
                          ),
                        ),
                        position: _firstTween,
                      ),
                      SlideTransition(
                        child: SlideTransition(
                          child: AnimatedContainer(
                            key: _keySecond,
                            width: width * 0.1,
                            height: height * 0.13,
                            child: Center(
                              child: Text(
                                _secondText,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: _secondColor,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            duration: Duration(milliseconds: 800),
                            curve: Curves.ease,
                          ),
                          position: _allAheadTween,
                        ),
                        position: _secondTween,
                      ),
                      SlideTransition(
                        child: SlideTransition(
                          child: AnimatedContainer(
                            key: _keyThird,
                            width: width * 0.1,
                            height: height * 0.13,
                            child: Center(
                              child: Text(
                                _thirdText,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: _thirdColor,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            duration: Duration(milliseconds: 800),
                            curve: Curves.ease,
                          ),
                          position: _allAheadTween,
                        ),
                        position: _thirdTween,
                      ),
                      SlideTransition(
                        position: _allAheadTween,
                        child: SlideTransition(
                          position: _fourthTween,
                          child: AnimatedContainer(
                            key: _keyFourth,
                            width: width * 0.1,
                            height: height * 0.13,
                            child: Center(
                              child: Text(
                                _fourthText,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: _fourthColor,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            duration: Duration(milliseconds: 800),
                            curve: Curves.ease,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  width: width * 0.1,
                  height: height * 0.13,
                  child: Center(
                    child: Text(
                      'E',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  duration: Duration(milliseconds: 800),
                  curve: Curves.ease,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      forwardAnimation();
                    });
                    print('Current element position $positionRequired');

                  },
                  child: Text('enqueue'),
                  color: kThemeColor,
                ),
                RaisedButton(
                    onPressed: () {

                      setState(() {
                        reverseAnimation();
                      });
                      print('Current element position $positionRequired');

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
    );
  }
}
