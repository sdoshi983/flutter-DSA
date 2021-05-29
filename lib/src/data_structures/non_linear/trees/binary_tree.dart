import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';
import 'package:dsa_simulation/src/utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:widget_arrows/arrows.dart';
import 'package:widget_arrows/widget_arrows.dart';

import '../../../constants.dart';

class BinaryTree extends StatefulWidget {
  @override
  _BinaryTreeState createState() => _BinaryTreeState();
}

class _BinaryTreeState extends State<BinaryTree> {
  int state = 0;
  void forward() {
    if (state == 0) {
    } else if (state == 1) {
    } else
      return;
    state++;
  }

  void reverse() {
    if (state == 1) {
    } else {
      return;
    }
    state--;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    path = ['Home','DS','Tree','BT'];
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, '/TreeMain', (route) => false);
        return true;
      },
      child: BaseTemplate(
        body: ArrowContainer(
          child: Scaffold(
            appBar: AppBar(
              leading: ClipRect(
                child: MaterialButton(
                  child: Icon(Icons.menu_rounded),
                  onPressed: () {
                    toggle();
                  },
                  splashColor: Colors.black,
                ),
              ),
              backgroundColor: kThemeColor,
              iconTheme: IconThemeData(color: Colors.white),
              title: Center(
                  child: Container(width: width * 0.9, height: 30, child: AddressBar())),
            ),
            body: Container(
              color: Colors.black,
              height: height,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Binary Tree',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white),
                  ),
                  Container(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ArrowElement(
                          id: '06',
                          targetId: '8',
                          flip: true,
                          targetAnchor: Alignment.topCenter,
                          sourceAnchor: Alignment.centerRight,
                          color: Colors.white,
                          child: ArrowElement(
                            id: '6',
                            targetId: '4',
                            color: Colors.white,
                            targetAnchor: Alignment.topCenter,
                            flip: true,
                            child: Positioned(
                              top: width * 0.001,
                              child: TreeNode(
                                color: state == 1 ? Colors.blue.withOpacity(0.6) : Colors.red,
                                title: state == 1 ? '2' : '6',
                              ),
                            ),
                          ),
                        ),
                        ArrowElement(
                          id: '04',
                          flip: true,
                          targetId: '1',
                          targetAnchor: Alignment.topCenter,
                          sourceAnchor: Alignment.centerRight,
                          color: Colors.white,
                          child: ArrowElement(
                            id: '4',
                            targetId: '7',
                            targetAnchor: Alignment.topCenter,
                            color: Colors.white,
                            flip: true,
                            child: Positioned(
                              top: width * 0.2,
                              left: width * 0.3,
                              child: TreeNode(
                                color: state == 1 ? Colors.blue.withOpacity(0.6) : Colors.blue,
                                title: state == 1 ? '2' : '4',
                              ),
                            ),
                          ),
                        ),
                        ArrowElement(
                          id: '8',
                          targetId: '3',
                          targetAnchor: Alignment.topCenter,
                          sourceAnchor: Alignment.centerRight,
                          flip: true,
                          color: Colors.white,
                          child: Positioned(
                            top: width * 0.2,
                            left: width * 0.6,
                            child: TreeNode(
                              color: state == 1
                                  ? Colors.blue.withOpacity(0.8)
                                  : Colors.green,
                              title: state == 1 ? '1' : '8',
                            ),
                          ),
                        ),
                        ArrowElement(
                          id: '7',
                          child: Positioned(
                            top: width * 0.4,
                            left: width * 0.15,
                            child: TreeNode(
                              color: state == 1
                                  ? Colors.lightBlueAccent
                                  : Colors.purple,
                              title: state == 1 ? '0' : '7',
                            ),
                          ),
                        ),
                        ArrowElement(
                          id: '1',
                          child: Positioned(
                            top: width * 0.4,
                            //left:width*0.45 ,
                            child: TreeNode(
                              color: state == 1
                                  ? Colors.lightBlueAccent
                                  : Colors.orange,
                              title: state == 1 ? '0' : '1',
                            ),
                          ),
                        ),
                        ArrowElement(
                          id: '3',
                          child: Positioned(
                            top: width * 0.4,
                            left: width * 0.75,
                            child: TreeNode(
                              color: state == 1
                                  ? Colors.lightBlueAccent
                                  : Colors.greenAccent,
                              title: state == 1 ? '0' : '3',
                            ),
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
                            //        print(state);
                          });
                        },
                        child: Icon(Icons.backspace_sharp),
                        color: kThemeColor,
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            forward();
                            //       print(state);
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
  Color color;
  String title;
  TreeNode({this.color, this.title});
  @override
  _TreeNodeState createState() => _TreeNodeState();
}

class _TreeNodeState extends State<TreeNode> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      decoration: BoxDecoration(
        color: widget.color,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 3,
        ),
      ),
      width: w * 0.11,
      height: w * 0.11,
      child: Center(
        child: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
