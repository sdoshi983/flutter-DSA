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
  double dataOpacity = 0;
  bool elementVisible = false;
  int state = 0;
  Color first = Colors.transparent,
      second = Colors.transparent,
      rest = Colors.transparent;
  void forward() {
    if (state == 0)
      elementVisible = true;
    else if(state==1);
    else if(state==2)
      elementVisible = false;
    else if(state==3)
    elementVisible = true;
    else
      return;
    state++;
  }

  void reverse() {
    if (state == 1)
      elementVisible = false;
    else if(state==2);
    else if(state==3)
      elementVisible = true;
    else if(state == 4)
      elementVisible = false;
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
                          sourceAnchor: Alignment.centerLeft,
                          targetAnchor: Alignment.topCenter,
                          id: '07',
                          targetId: '6',
                          arcDirection: ArcDirection.Left,
                          child: ArrowElement(
                            flip: true,
                            tipLength: tipLength,
                            color: state > 1 ? Colors.white : Colors.transparent,
                            bow: 0,
                            sourceAnchor: Alignment.centerRight,
                            targetAnchor: Alignment.topCenter,
                            id: '7',
                            targetId: '5',
                            arcDirection: ArcDirection.Right,
                            child: TreeNode(
                              isVisible: elementVisible,
                              dataOpacity: elementVisible ? 1 : 0,
                              color: Colors.red,
                              title: state > 2 ? '1' : '7',
                              left: width * 0.45,
                            ),
                          ),
                        ),
                        ArrowElement(
                          color: state > 1 ? Colors.white : Colors.transparent,
                          tipLength: tipLength,
                          id: '06',
                          targetId: '3',
                          sourceAnchor: Alignment.centerRight,
                          targetAnchor: Alignment.topCenter,
                          flip: true,
                          child: ArrowElement(
                            color: state > 1 ? Colors.white : Colors.transparent,
                            tipLength: tipLength,
                            id: '6',
                            targetId: '4',
                            targetAnchor: Alignment.topCenter,
                            flip: true,
                            child: TreeNode(
                              isVisible: elementVisible,
                              dataOpacity: elementVisible ? 1 : 0,

                              color: Colors.green,
                              title: state > 2 ? '2' : '6',
                              top: width * 0.2,
                              left: width * 0.2,
                            ),
                          ),
                        ),
                        ArrowElement(
                          id: '05',
                          targetId: '1',
                          tipLength: tipLength,
                          targetAnchor: Alignment.topCenter,
                          sourceAnchor: Alignment.centerRight,
                          flip: true,
                          color: state > 1 ? Colors.white : Colors.transparent,
                          child: ArrowElement(
                            id: '5',
                            targetId: '2',
                            tipLength: tipLength,
                            targetAnchor: Alignment.topCenter,
                            sourceAnchor: Alignment.centerLeft,
                            flip: true,
                            color: state > 1 ? Colors.white : Colors.transparent,
                            child: TreeNode(
                              dataOpacity: elementVisible ? 1 : 0,

                              color: Colors.blue,
                              title: state > 2 ? '3' : '5',
                              top: width * 0.2,
                              left: width * 0.71,
                              isVisible: elementVisible,
                            ),
                          ),
                        ),
                        ArrowElement(
                          id: '4',
                          child: TreeNode(
                          //  id: '4',
                            dataOpacity: elementVisible ? 1 : 0,

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
                            dataOpacity: elementVisible ? 1 : 0,

                            color: Colors.orange,
                            //  targetId: '2',
                            isVisible: elementVisible,
                            title: state > 2 ? '5' : '3',
                            top: width * 0.4,
                            left: width * 0.3,
                          ),
                        ),
                        ArrowElement(
                          id: '2',
                          child: TreeNode(
                            dataOpacity: elementVisible ? 1 : 0,

                            color: Colors.purple,
                            //  targetId: '2',
                            title: state > 2 ? '6' : '2',
                            top: width * 0.4,
                            left: width * 0.6,
                            isVisible: elementVisible,
                          ),
                        ),
                        ArrowElement(
                          id: '1',
                          child: TreeNode(
                            dataOpacity: elementVisible ? 1 : 0,

                            color: Colors.deepOrangeAccent,
                            //  targetId: '2',
                            title: state > 2 ? '7' : '1',
                            top: width * 0.4,
                            left: width * 0.82,
                            isVisible: elementVisible,
                          ),
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
  String title;
  Color color;

  bool isVisible;
  double tipLength;
  double dataOpacity;
  double top = 100, left = 0;
  TreeNode({
    this.isVisible,
    this.color,
    this.title,
    this.dataOpacity,
    this.top,
    this.left,
    this.tipLength,

  });

  @override
  _TreeNodeState createState() => _TreeNodeState();
}

class _TreeNodeState extends State<TreeNode> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Positioned(
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
          child: AnimatedOpacity(
            opacity: widget.dataOpacity,
            duration: Duration(milliseconds: 800),
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
