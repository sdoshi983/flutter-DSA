import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';
import 'package:dsa_simulation/src/utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:widget_arrows/arrows.dart';
import 'package:widget_arrows/widget_arrows.dart';

import '../../../constants.dart';

class TreeIntroduction extends StatefulWidget {
  @override
  _TreeIntroductionState createState() => _TreeIntroductionState();
}

class _TreeIntroductionState extends State<TreeIntroduction> {
  double tipLength = 10;
  bool elementVisible = false;
  int state = -1;
  Color first = Colors.transparent,
      second = Colors.transparent,
      third = Colors.transparent,
      fourth = Colors.transparent,
      rest = Colors.transparent;
  void forward() {
    if (state == -1) {
    } else if (state == 0)
      elementVisible = true;
    else if (state == 1) {
    } else if (state == 2) {
    } else if (state == 3)
      rest = Colors.white;
    else if (state == 4)
      first = Colors.white;
    else if (state == 5)
      second = Colors.white;
    else if (state == 6) {
      third = Colors.white;
      second = Colors.transparent;
      first = Colors.transparent;
    } else if (state == 7)
      fourth = Colors.white;
    else if (state == 8) {
      fourth = Colors.transparent;
    } else
      return;
    state++;
  }

  void reverse() {
    if (state == 0) {
    } else if (state == 1)
      elementVisible = false;
    else if (state == 2) {
    } else if (state == 3) {
    } else if (state == 4)
      rest = Colors.transparent;
    else if (state == 5)
      first = Colors.transparent;
    else if (state == 6)
      second = Colors.transparent;
    else if (state == 7) {
      second = Colors.white;
      first = Colors.white;
      third = Colors.transparent;
    } else if (state == 8)
      fourth = Colors.transparent;
    else
      return;
    state--;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    //path = ['Home', 'DS', 'Trees', 'Intro'];
    //print('introduction');
    // print(path);
    print(state);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, '/TreeMain', (route) => false);
        return true;
      },
      child: BaseTemplate(
        body: ArrowContainer(
          child: Scaffold(
            appBar: appBar(context),
            body: Container(
              color: Colors.black,
              height: height,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Introduction to Tree',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white),
                  ),
                  Container(
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          top: width * 0.5,
                          left: width * 0.55,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            height: width * 0.12,
                            width: width * 0.8,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                            ),
                            child: Text(
                              'hee',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          duration: Duration(
                            milliseconds: 800,
                          ),
                        ),
                        ArrowElement(
                          tipLength: tipLength,
                          id: 'root',
                          targetId: '1',
                          flip: true,
                          targetAnchor: Alignment.topCenter,
                          color: first,
                          child: Positioned(
                            child: Text(
                              'Root Node',
                              style: TextStyle(
                                color: first,
                                fontSize: 16,
                              ),
                            ),
                            right: 5,
                          ),
                        ),
                        ArrowElement(
                          flip: true,
                          tipLength: tipLength,
                          color: state > 2 ? Colors.white : Colors.transparent,
                          bow: 0,
                          sourceAnchor: Alignment.centerRight,
                          targetAnchor: Alignment.topCenter,
                          id: '01',
                          targetId: '3',
                          child: TreeNode(
                            isVisible: elementVisible,
                            id: '1',
                            targetId: '2',
                            color: state < 0 ? Colors.transparent : Colors.red,
                            arrowColor:
                                state > 1 ? Colors.white : Colors.transparent,
                            title: '1',
                            left: width * 0.45,
                            source: Alignment.centerLeft,
                            target: Alignment.topCenter,
                          ),
                        ),
                        ArrowElement(
                          id: '0002',
                          tipLength: tipLength,
                          color: rest,
                          targetId: '6',
                          targetAnchor: Alignment.topCenter,
                          sourceAnchor: Alignment.centerRight,
                          flip: true,
                          child: ArrowElement(
                            id: '002',
                            targetId: '5',
                            tipLength: tipLength,
                            color: rest,
                            sourceAnchor: Alignment.bottomCenter,
                            targetAnchor: Alignment.topCenter,
                            child: ArrowElement(
                              color: rest,
                              tipLength: tipLength,
                              id: '02',
                              targetId: '4',
                              targetAnchor: Alignment.topCenter,
                              flip: true,
                              child: TreeNode(
                                isVisible: elementVisible,
                                id: '2',
                                color: state < 0
                                    ? Colors.transparent
                                    : Colors.green,
                                title: '2',
                                top: width * 0.2,
                                left: width * ((1 / 3) - 0.05),
                              ),
                            ),
                          ),
                        ),
                        ArrowElement(
                          id: '03',
                          targetId: '7',
                          tipLength: tipLength,
                          targetAnchor: Alignment.centerLeft,
                          sourceAnchor: Alignment.bottomCenter,
                          //flip: true,
                          color: rest,
                          child: TreeNode(
                            id: '3',
                            color: state < 0 ? Colors.transparent : Colors.blue,
                            title: '3',
                            top: width * 0.2,
                            left: width * ((2 / 3) - 0.05),
                            isVisible: elementVisible,
                          ),
                        ),
                        TreeNode(
                          id: '4',
                          color: state < 0 ? Colors.transparent : Colors.cyan,
                          isVisible: elementVisible,
                          title: '4',
                          top: width * 0.4,
                          left: width * ((1 / 6) - 0.05),
                        ),
                        TreeNode(
                          id: '5',
                          color: state < 0 ? Colors.transparent : Colors.orange,
                          //  targetId: '2',
                          isVisible: elementVisible,
                          title: '5',
                          top: width * 0.4,
                          left: width * ((2 / 6) - 0.05),
                        ),
                        TreeNode(
                          id: '6',
                          color: state < 0 ? Colors.transparent : Colors.purple,
                          //  targetId: '2',
                          title: '6',
                          top: width * 0.4,
                          left: width * ((3 / 6) - 0.05),
                          isVisible: elementVisible,
                        ),
                        TreeNode(
                          id: '7',
                          color: state < 0
                              ? Colors.transparent
                              : Colors.deepOrangeAccent,
                          //  targetId: '2',
                          title: '7',
                          top: width * 0.4,
                          left: width * ((5 / 6) - 0.05),
                          isVisible: elementVisible,
                        ),
                        ArrowElement(
                          id: 'leaf',
                          targetId: '7',
                          targetAnchor: Alignment.bottomCenter,
                          sourceAnchor: Alignment.centerRight,
                          tipLength: tipLength,
                          color: second,
                          child: ArrowElement(
                            id: 'lea',
                            tipLength: tipLength,
                            targetId: '6',
                            sourceAnchor: Alignment.topCenter,
                            targetAnchor: Alignment.bottomCenter,
                            color: second,
                            child: ArrowElement(
                              tipLength: tipLength,
                              flip: true,
                              id: 'le',
                              targetId: '5',
                              targetAnchor: Alignment.bottomCenter,
                              sourceAnchor: Alignment.centerLeft,
                              color: second,
                              child: ArrowElement(
                                id: 'l',
                                targetId: '4',
                                tipLength: tipLength,
                                color: second,
                                targetAnchor: Alignment.bottomCenter,
                                child: Positioned(
                                  top: width * 0.65,
                                  left: width * 0.45,
                                  child: Text(
                                    'Leaves',
                                    style: TextStyle(
                                      color: second,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ArrowElement(
                          flip: true,
                          id: 'parent',
                          targetId: '1',
                          sourceAnchor: Alignment.centerRight,
                          targetAnchor: Alignment.topCenter,
                          color: third,
                          child: Positioned(
                            left: width * 0.1,
                            child: Text(
                              'Parent',
                              style: TextStyle(
                                color: third,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        ArrowElement(
                          id: 'child',
                          targetId: '3',
                          flip: true,
                          tipLength: tipLength,
                          sourceAnchor: Alignment.bottomCenter,
                          targetAnchor: Alignment.centerRight,
                          color: fourth,
                          child: Positioned(
                            top: width * 0.1,
                            right: width * 0.05,
                            child: Text(
                              'Child',
                              style: TextStyle(color: fourth, fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                    width: width,
                    height: height * 0.6,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            reverse();
                            print(state);
                          });
                        },
                        child: Icon(Icons.backspace_sharp),
                        color: kThemeColor,
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            forward();
                            print(state);
                          });
                        },
                        child: Icon(Icons.forward),
                        color: kThemeColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TreeNode extends StatefulWidget {
  String title, id, targetId;
  Color color, arrowColor;
  Alignment source, target;
  bool isVisible;
  double tipLength;
  double top = 100, left = 0;
  TreeNode({
    this.isVisible,
    this.color,
    this.title,
    this.id,
    this.targetId,
    this.source,
    this.target,
    this.top,
    this.left,
    this.tipLength,
    this.arrowColor,
  });

  @override
  _TreeNodeState createState() => _TreeNodeState();
}

class _TreeNodeState extends State<TreeNode> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return ArrowElement(
      flip: true,
      //   tipAngleOutwards: 0,
      tipLength: widget.tipLength ?? 10,
      color: widget.arrowColor,
      straights: false,
      bow: 0,
      id: widget.id,
      targetId: widget.targetId,
      sourceAnchor: widget.source,
      targetAnchor: widget.target,
      child: Positioned(
        top: widget.top,
        left: widget.left,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 600),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.isVisible ? Colors.white : Colors.transparent,
            border: Border.all(
                color: widget.isVisible ? Colors.white : Colors.transparent,
                width: 3),
          ),
          child: CircleAvatar(
            radius: w * 0.05,
            backgroundColor: widget.color,
            child: Text(
              widget.title,
              style: TextStyle(
                color: widget.isVisible ? Colors.white : Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
