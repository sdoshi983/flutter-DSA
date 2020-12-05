import 'package:flutter/material.dart';
import 'introduction.dart';
import 'package:dsa_simulation/src/constants.dart';

class Element extends StatelessWidget {
  final Color color;
  final String name;

  const Element({Key key, this.color, this.name});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      key: key,
      width: w * 0.2,
      height: h * 0.05,
      child: Center(
        child: Text(
          '$name',
          style: TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(9),
      ),
      duration: Duration(milliseconds: 800),
      curve: Curves.ease,
    );
  }
}

class ArrayInsert extends StatefulWidget {
  @override
  _ArrayInsertState createState() => _ArrayInsertState();
}

class _ArrayInsertState extends State<ArrayInsert>
    with TickerProviderStateMixin {
  double heightFactor = 0.3;
  Color lastElementColor = Colors.black, newElementColor = Colors.black;
  GlobalKey _keyLastElement = GlobalKey(),
      _keyNewElement = GlobalKey(),
      _keySecondElement = GlobalKey(),
      _keyThirdElement = GlobalKey();
  int currentState = 0;
  String newElementText = '';
  Offset thirdElementOffset = Offset(0, 2),
      secondElementOffset = Offset(0, 2),
      newElementOffset;
  bool flag = false;
  Size arrayElementSize;
  double down = 0.0, newElementDx = 0.0, newElementDy = 0.0;
  AnimationController _controller, _secondController;
  Animation<Offset> _downOffet, _newElementOffset, _lastElementOffset;
  Offset _getPositions(GlobalKey a) {
    final RenderBox renderBox = a.currentContext.findRenderObject();
    final position = renderBox.localToGlobal(Offset.zero);
    print("POSITION : $position ");
    return position;
  }

  Size _getSizes(GlobalKey a) {
    final RenderBox renderBox = a.currentContext.findRenderObject();
    final size = renderBox.size;
    print("SIZE : $size");
    return size;
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    _secondController =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    _downOffet =
        Tween<Offset>(begin: Offset.zero, end: Offset(0, down)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
    _newElementOffset = Tween<Offset>(
            begin: Offset.zero, end: Offset(newElementDx, newElementDy))
        .animate(
      CurvedAnimation(
        parent: _secondController,
        curve: Curves.ease,
      ),
    );
    _lastElementOffset = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0, -2.00 * down),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
    _secondController.dispose();
  }

  void forwardAnimation() {
    if (currentState == 0) {
      print('Height $heightFactor');
      heightFactor = 0.35;
      lastElementColor = Colors.white60;

      print('I am here $heightFactor');
    } else if (currentState == 1) {
      newElementText = 'New';
      newElementColor = Colors.cyan;
      if (!flag) {
        flag = true;
        arrayElementSize = _getSizes(_keyLastElement);
        thirdElementOffset = _getPositions(_keyThirdElement);
        secondElementOffset = _getPositions(_keySecondElement);
        newElementOffset = _getPositions(_keyNewElement);
        double dy = thirdElementOffset.dy - secondElementOffset.dy;
        down = dy / arrayElementSize.height;
        dy = secondElementOffset.dy - newElementOffset.dy;
        double dx = secondElementOffset.dx - newElementOffset.dx;
        newElementDx = dx / arrayElementSize.width;
        newElementDy = dy / arrayElementSize.height;
        _downOffet =
            Tween<Offset>(begin: Offset.zero, end: Offset(0, down)).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.ease,
          ),
        );
        _newElementOffset = Tween<Offset>(
                begin: Offset.zero, end: Offset(newElementDx, newElementDy))
            .animate(
          CurvedAnimation(
            parent: _secondController,
            curve: Curves.ease,
          ),
        );
        _lastElementOffset = Tween<Offset>(
          begin: Offset.zero,
          end: Offset(0, -2.00 * down),
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.ease,
          ),
        );
      }
    } else if (currentState == 2) {
      _controller.forward();
    } else if (currentState == 3) {
      _secondController.forward();
      lastElementColor = Colors.transparent;

    }
    currentState += 1;
  }

  void reverseAnimation() {
    if (currentState == 1) {
      heightFactor = 0.3;
      lastElementColor = Colors.black;
    } else if (currentState == 2) {
      newElementColor = Colors.black;
      newElementText = '';
    } else if (currentState == 3) {

      _controller.reverse();
    } else if (currentState == 4) {
      lastElementColor = Colors.white60;

      _secondController.reverse();
    }
    currentState -= 1;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Array',
        ),
        backgroundColor: kThemeColor,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Insertion in Array',
              style: Theme.of(context).textTheme.headline6,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 800),
              curve: Curves.ease,
              height: heightFactor * height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SlideTransition(
                    child: AnimatedContainer(
                      key: _keyNewElement,
                      width: width * 0.2,
                      height: height * 0.05,
                      child: Center(
                        child: Text(
                          newElementText,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: newElementColor,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      duration: Duration(milliseconds: 800),
                      curve: Curves.ease,
                    ),
                    position: _newElementOffset,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Element(
                        name: 'Hello',
                        color: Colors.green,
                      ),
                      SlideTransition(
                        position: _downOffet,
                        child: AnimatedContainer(
                          key: _keySecondElement,
                          width: width * 0.2,
                          height: height * 0.05,
                          child: Center(
                            child: Text(
                              'World',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          duration: Duration(milliseconds: 800),
                          curve: Curves.ease,
                        ),
                      ),
                      SlideTransition(
                        position: _downOffet,
                        child: AnimatedContainer(
                          key: _keyThirdElement,
                          width: width * 0.2,
                          height: height * 0.05,
                          child: Center(
                            child: Text(
                              'Heyy',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          duration: Duration(milliseconds: 800),
                          curve: Curves.ease,
                        ),
                      ),
                      SlideTransition(
                        position: _lastElementOffset,
                        child: AnimatedContainer(
                          key: _keyLastElement,
                          width: width * 0.2,
                          height: height * 0.05,
                          child: Center(
                            child: Text(
                              ' ',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: lastElementColor,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          duration: Duration(milliseconds: 800),
                          curve: Curves.ease,
                        ),
                      ),
                    ],
                  ),
                  Element(
                    name: ' ',
                    color: Colors.black,
                  ),
                ],
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
                        //  lastElementColor = Colors.grey;
                      });
                    },
                    child: Icon(Icons.forward),
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
