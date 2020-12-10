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
  int currentState = 0;
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
      _allAheadTween;
  Size _elementSize = Size(0.1, 0.13);
  bool isCalculated = false;
  Offset _fourthElementPosition = Offset(0, 0),
      _thirdElementPosition = Offset(0, 0),
      _oneMoveOffset,
      _startingPoint,
      _nextElementPosition = Offset(0, 0),
      _currentElementPosition = Offset(0, 0);

  @override
  void dispose() {
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
    _allAheadTween =
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

  void forwardAnimation() {
    if (currentState % 4 == 0) {
      _fourthColor = Colors.red;

      if (!isCalculated) {
        isCalculated = true;
        _elementSize = getSizes(_keyFirst);
        _fourthElementPosition = getPositions(_keyFourth);
        _thirdElementPosition = getPositions(_keyThird);
        _nextElementPosition = _fourthElementPosition;
        _startingPoint = getPositions(_keyStart);
        double dx = _fourthElementPosition.dx - _thirdElementPosition.dx;
        double dy = 0;
        _oneMoveOffset = Offset(dx, dy);
      }
      print("Before Animation");
      print('${_nextElementPosition.dx}');
      //Calculation is completed...
      Offset initialOffset, finalOffset;
      _currentElementPosition = getPositions(_keyFourth);
      double dx =
          (_startingPoint.dx - _currentElementPosition.dx) / _elementSize.width;
      initialOffset = Offset(dx, 0);
      print('========>Initial offset:- $dx');
      dx = (_nextElementPosition.dx - _currentElementPosition.dx) /
          _elementSize.width;
      print('========>Final offset:- $dx');

      finalOffset = Offset(dx, 0);

      _firstTween =
          Tween<Offset>(begin: initialOffset, end: finalOffset).animate(
        CurvedAnimation(
          parent: _firstController,
          curve: Curves.ease,
        ),
      );
      _firstController.forward();

      // print(Offset.zero.dx);
    } else {
      return;
    }
    _nextElementPosition =
        Offset(_nextElementPosition.dx - _oneMoveOffset.dx, 0);
    print("After Animation");
    print('${_nextElementPosition.dx}');
    currentState += 1;
  }

  void reverseAnimation() {
    if (currentState == 1) {
      print("Before Animation");
      print('${_nextElementPosition.dx}');
      Offset initialOffset = Offset.zero,
          finalOffset = Offset(_oneMoveOffset.dx / _elementSize.width, 0);
      _allAheadTween =
          Tween<Offset>(begin: initialOffset, end: finalOffset).animate(
        CurvedAnimation(
          parent: _allAheadController,
          curve: Curves.ease,
        ),
      );
      _allAheadController.forward();
      _fourthColor = Colors.transparent;
    } else
      return;
    currentState -= 1;
    _nextElementPosition =
        Offset(_nextElementPosition.dx + _oneMoveOffset.dx, 0);
    print("After Animation");
    print('${_nextElementPosition.dx}');
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
                      SlideTransition(
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
                      SlideTransition(
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
                      SlideTransition(
                        position: _allAheadTween,
                        child: SlideTransition(
                          position: _firstTween,
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
                  },
                  child: Text('enqueue'),
                  color: kThemeColor,
                ),
                RaisedButton(
                    onPressed: () {
                      setState(() {
                        reverseAnimation();
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
    );
  }
}
