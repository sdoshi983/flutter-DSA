import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';
import 'package:dsa_simulation/src/utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:widget_arrows/arrows.dart';
import 'package:widget_arrows/widget_arrows.dart';
import '../../../../constants.dart';


class AvlIntroduction extends StatefulWidget {
  @override
  _AvlIntroductionState createState() => _AvlIntroductionState();
}

class _AvlIntroductionState extends State<AvlIntroduction> {
  double seventyt = 0.44, eightyFivet = 0.238, fiftyt = 0.44, nintyFivet = 0.04, fourtyFivet = 0.44, sixtyt = 0.235, tent = 0.44;

  double seventyl = 0.137, eightyFivel = 0.235, fiftyl = 0.635, nintyFivel = 0.485, fourtyFivel = 0.34, sixtyl = 0.747, tenl = 0.855;

  double tipLength = 10;
  bool elementVisible = true;
  int state = -1;
  double currentHeight = 0.001,currentWidth = 0.2;
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
      third = Colors.transparent;
    }
    else if(state==9){
      currentHeight = 0.17;currentWidth = 0.6;
    }
    else if(state==10){
      currentHeight = 0.37;currentWidth = 0.9;
    }
    else
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
      third = Colors.transparent;

      second = Colors.white;
      first = Colors.white;
    } else if (state == 8){
      fourth = Colors.transparent;

    }
    else if(state==9){
      fourth = Colors.white;third=Colors.white;
    }
    else if(state==10){
      currentWidth = 0.2;currentHeight = 0.001;
    }
    else if(state==11){
      currentWidth = 0.6;currentHeight = 0.17;
    }
    else
      return;
    state--;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    path = ['Home', 'DS', 'Trees', 'AVL', 'Intro'];
    //print('introduction');
    // print(path);
    print(state);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, '/AvlMainPage', (route) => false);
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
                    'Introduction to AVL/BBST Tree',
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
                          color: Colors.white,
                          bow: 0,
                          sourceAnchor: Alignment.centerLeft,
                          targetAnchor: Alignment.topCenter,
                          id: '07',
                          targetId: '6',
                          arcDirection: ArcDirection.Left,
                          child: ArrowElement(
                            flip: true,
                            tipLength: tipLength,
                            color: Colors.white,
                            bow: 0,
                            sourceAnchor: Alignment.centerRight,
                            targetAnchor: Alignment.topCenter,
                            id: '7',
                            targetId: '5',
                            arcDirection: ArcDirection.Right,
                            child: TreeNode(
                              isVisible: elementVisible,
                              color: Colors.red,
                              title: '0',
                              left: width * 0.45,
                            ),
                          ),
                        ),
                        ArrowElement(
                          color: Colors.white,
                          tipLength: tipLength,
                          id: '6',
                          targetId: '3',
                          sourceAnchor: Alignment.centerRight,
                          targetAnchor: Alignment.topCenter,
                          arcDirection: ArcDirection.Right,
                          child: TreeNode(
                            isVisible: elementVisible,
                            color: Colors.green,
                            title: '-1',
                            top: width * 0.2,
                            left: width * 0.23,
                          ),
                        ),
                        ArrowElement(
                          id: '5',
                          targetId: '2',
                          tipLength: tipLength,
                          targetAnchor: Alignment.topCenter,
                          sourceAnchor: Alignment.centerLeft,
                          flip: true,
                          color: Colors.white,
                          child: TreeNode(
                            color: Colors.blue,
                            title: '1',
                            top: width * 0.2,
                            left: width * 0.67,
                            isVisible: elementVisible,
                          ),
                        ),
                        // ArrowElement(
                        //   id: '4',
                        //   child: TreeNode(
                        //     //  id: '4',
                        //     color: Colors.cyan,
                        //     isVisible: elementVisible,
                        //     title: '0',
                        //     top: width * 0.4,
                        //     left: width * 0.1,
                        //   ),
                        // ),
                        ArrowElement(
                          id: '3',
                          child: TreeNode(
                            //id: '3',
                            color: Colors.orange,
                            //  targetId: '2',
                            isVisible: elementVisible,
                            title: '0',
                            top: width * 0.4,
                            left: width * 0.3,
                          ),
                        ),
                        ArrowElement(
                          id: '2',
                          child: TreeNode(
                            color: Colors.purple,
                            //  targetId: '2',
                            title: '0',
                            top: width * 0.4,
                            left: width * 0.6,
                            isVisible: elementVisible,
                          ),
                        ),
                        // ArrowElement(
                        //   id: '1',
                        //   child: TreeNode(
                        //     color: Colors.deepOrangeAccent,
                        //     //  targetId: '2',
                        //     title: state > 2 ? '7' : '1',
                        //     top: width * 0.4,
                        //     left: width * 0.82,
                        //     isVisible: elementVisible,
                        //   ),
                        // ),

                        // ------------------------------- Data --------------------------------

                        // Positioned(
                        //   top: width * seventyt,
                        //   left: width * seventyl,
                        //   child: Text(
                        //     '70',
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // ),
                        // Positioned(
                        //   top: width * eightyFivet,
                        //   left: width * eightyFivel,
                        //   child: Text(
                        //     '85',
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // ),
                        // Positioned(
                        //   top: width * fiftyt,
                        //   left: width * fiftyl,
                        //   child: Text(
                        //     '50',
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // ),
                        // Positioned(
                        //   top: width * nintyFivet,
                        //   left: width * nintyFivel,
                        //   child: Text(
                        //     '95',
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // ),
                        // Positioned(
                        //   top: width * fourtyFivet,
                        //   left: width * fourtyFivel,
                        //   child: Text(
                        //     '45',
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // ),
                        // Positioned(
                        //   top: width * sixtyt,
                        //   left: width * sixtyl,
                        //   child: Text(
                        //     '60',
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // ),
                        // Positioned(
                        //   top: width * tent,
                        //   left: width * tenl,
                        //   child: Text(
                        //     '10',
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // ),

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
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
