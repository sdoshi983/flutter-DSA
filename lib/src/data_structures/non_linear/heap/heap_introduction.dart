import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';
import 'package:dsa_simulation/src/utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:widget_arrows/arrows.dart';
import 'package:widget_arrows/widget_arrows.dart';

import '../../../constants.dart';

class HeapIntroduction extends StatefulWidget {
  @override
  _HeapIntroductionState createState() => _HeapIntroductionState();
}

class _HeapIntroductionState extends State<HeapIntroduction> {
  double tipLength = 10;
  bool elementVisible = false;
  int state = 0;
  Color first = Colors.transparent,
      second = Colors.transparent,
      rest = Colors.transparent;
  void forward() {
    if (state == 0)
      elementVisible = true;
    else if (state == 1) {
    } else if (state == 2) {
    } else if (state == 3)

      rest = Colors.white;
    else if(state==4)first=Colors.white;
    else if(state==5)second=Colors.white;
    else
      return;
    state++;
  }

  void reverse() {
    if (state == 1)
      elementVisible = false;
    else if (state == 2) {
    } else if (state == 3) {
    } else if (state == 4)
      rest = Colors.transparent;
    else if(state==5)first=Colors.transparent;
    else if(state==6)second=Colors.transparent;
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
            context, '/HeapMainPage', (route) => false);
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
                    'Introduction to Heaps',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white),
                  ),
                  Container(
                    child: Stack(
                      children: [
                        ArrowElement(
                          flip: true,
                          tipLength: tipLength,
                          color: state > 1 ? Colors.white : Colors.transparent,
                          bow: 0,
                          sourceAnchor: Alignment.centerRight,
                          targetAnchor: Alignment.topCenter,
                          id: '07',
                          targetId: '5',
                          arcDirection: ArcDirection.Right,
                          child: TreeNode(
                            isVisible: elementVisible,
                            id: '7',
                            targetId: '6',
                            color: Colors.red,
                            arrowColor:
                            state > 1 ? Colors.white : Colors.transparent,
                            title: '7',
                            left: width * 0.45,
                            source: Alignment.centerLeft,
                            target: Alignment.topCenter,
                            arcDirection: ArcDirection.Left,
                          ),
                        ),
                        ArrowElement(
                          color:  Colors.white,
                          tipLength: tipLength,
                          id: '6',
                          targetId: '3',
                          targetAnchor: Alignment.topCenter,
                          flip: true,
                          child: TreeNode(
                            isVisible: elementVisible,
                          //  id: '06',
                        //    targetId: '3',
                            color: Colors.green,
                            arrowColor: Colors.white,
                            title: '6',
                            top: width * 0.2,
                            left: width * 0.2,
                            source: Alignment.bottomCenter,
                          ),
                        ),
                        ArrowElement(
                          id: '5',
                          targetId: '2',
                          tipLength: tipLength,
                          targetAnchor: Alignment.topCenter,
                          sourceAnchor: Alignment.centerRight,
                          flip: true,
                          color: Colors.white,
                          child: TreeNode(
                            id: '5',
                            targetId: '1',
                            color: Colors.blue,
                            title: '5',
                            top: width * 0.2,
                            left: width * 0.71,
                            isVisible: elementVisible,
                          ),
                        ),
                        ArrowElement(
                          id: '4',

                          child: TreeNode(
                          //  id: '4',
                            color: Colors.cyan,
                            isVisible: elementVisible,
                            title: '4',
                            top: width * 0.4,
                            left: width * 0.1,
                          ),
                        ),
                        ArrowElement(
                          id: '3',
                          child: TreeNode(
                            //id: '3',
                            color: Colors.orange,
                            //  targetId: '2',
                            isVisible: elementVisible,
                            title: '3',
                            top: width * 0.4,
                            left: width * 0.3,
                          ),
                        ),
                        TreeNode(
                          id: '2',
                          color: Colors.purple,
                          //  targetId: '2',
                          title: '2',
                          top: width * 0.4,
                          left: width * 0.6,
                          isVisible: elementVisible,
                        ),
                        TreeNode(
                          id: '1',
                          color: Colors.deepOrangeAccent,
                          //  targetId: '2',
                          title: '1',
                          top: width * 0.4,
                          left: width * 0.82,
                          isVisible: elementVisible,
                        ),

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
                          color: kThemeColor),
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
  ArcDirection arcDirection = ArcDirection.Left;
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
    this.arcDirection
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
      arcDirection: widget.arcDirection,
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
