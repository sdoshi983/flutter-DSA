import 'package:flutter/material.dart';

import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';
import 'package:widget_arrows/widget_arrows.dart';

import '../../../../constants.dart';

class NodePosition {
  double x, y;
  int value;
  NodePosition({this.x, this.y, this.value});
}

class Child {
  NodePosition left, right;
  Child({this.right, this.left});
}

class BstSearching extends StatefulWidget {
  @override
  _BstSearchingState createState() => _BstSearchingState();
}

class _BstSearchingState extends State<BstSearching> {
  double tipLength = 5;
  int state = -1;
  int value = 0;
  Color startColor = Colors.blue;
  Color searchColor = Colors.transparent;
  NodePosition node6 = NodePosition(x: 0.44, y: 0, value: 6),
      node3 = NodePosition(x: 0.25, y: 0.1, value: 3),
      node10 = NodePosition(x: 0.64, y: 0.1, value: 10),
      node1 = NodePosition(y: 0.2, x: 0.15, value: 1),
      node4 = NodePosition(y: 0.2, x: 0.35, value: 4),
      node7 = NodePosition(y: 0.2, x: 0.54, value: 7),
      node15 = NodePosition(y: 0.2, x: 0.74, value: 15);
  bool searchCompleted = false;
  NodePosition searchWalk = NodePosition(
    x: 0.44,
    y: 0,
  );
  List<NodePosition> allPosition = [
    null,
  ];
  Map<NodePosition, Child> tree = {};
//  tree[node6] = Child(left:node3,right:node10);
  void makeTree() {
    tree = {
      node6: Child(left: node3, right: node10),
      node3: Child(left: node1, right: node4),
      node10: Child(left: node7, right: node15),
      node1: null,
      node4: null,
      node7: null,
      node15: null,
    };
  }

  void goLeft() {
    allPosition.add(searchWalk);
    searchWalk = tree[searchWalk].left;
  }

  void goRight() {
    allPosition.add(searchWalk);

    searchWalk = tree[searchWalk].right;
  }

  void forward() {
    if (tree == {}) return;
    if(state==-1){
      state = 0;
      searchColor = Colors.blue;
      searchCompleted = false;
      searchWalk = node6;
      return;
    }
    if (state == 0) {
      allPosition.add(node6);
      searchWalk = node6;
      state++;
      return;
    }
    if (searchWalk.value == value) {
      searchColor = Colors.green;
      searchCompleted = true;
      state = -1;
    } else if (searchWalk.value < value) {
      if (tree[searchWalk] == null || tree[searchWalk].right == null) {
        searchColor = Colors.red;
        searchCompleted = true;
        state = -1;
      } else {
        goRight();
      }
    } else {
      if (tree[searchWalk] == null || tree[searchWalk].left == null) {
        searchColor = Colors.red;
        searchCompleted = true;
        state = -1;
      } else {
        goLeft();
      }
    }
    state++;
  }

  void reverse() {
    if(state==0){
      state=-1;searchColor=Colors.transparent;
    //  allPosition.removeLast();
      return;
    }
    if (searchCompleted) {
      searchColor = Colors.blue;
      state--;
      searchCompleted = false;
      return;
    }
    else{
      state--;
      searchWalk = allPosition.last;
      allPosition.removeLast();
    }
  }

  @override
  Widget build(BuildContext context) {
    makeTree();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    path = ['Home', 'DS', 'Trees', 'BST', 'Search'];

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(context, '/BST', (route) => false);
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
                child: Container(
                  width: width * 0.9,
                  height: 30,
                  child: AddressBar(),
                ),
              ),
            ),
            body: Container(
              width: width,
              color: Colors.black,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'BST Searching',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width * 0.2,
                            height: 40,
                            child: TextField(
                              onChanged: (value1) {
                                setState(() {
                                  value = int.parse(value1);
                                });
                              },
                              decoration: InputDecoration(
                                  labelText: 'Enter',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                state = 0;
                                searchColor = Colors.blue;
                                searchCompleted = false;
                                searchWalk = node6;
                              });
                            },
                            child: Text(
                              'Search',
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                value = 0;
                                state = -1;
                                searchColor = Colors.transparent;
                                searchWalk = node6;
                              });
                            },
                            child: Text(
                              'Reset',
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: height * 0.6,
                        width: width,
                        color: Colors.black,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ArrowElement(
                              id: '01',
                              targetId: '5',
                              sourceAnchor: Alignment.centerRight,
                              targetAnchor: Alignment.topCenter,
                              color: Colors.white,
                              flip: true,
                              child: ArrowElement(
                                id: '1',
                                targetId: '10',
                                sourceAnchor: Alignment.centerLeft,
                                targetAnchor: Alignment.topCenter,
                                color: Colors.white,
                                flip: true,
                                child: Positioned(
                                  top: height * node6.y,
                                  left: width * node6.x,
                                  child: Node(
                                    text: '6',
                                    color: startColor,
                                  ),
                                ),
                              ),
                            ),
                            //1
                            ArrowElement(
                              id: '010',
                              targetId: '2',
                              sourceAnchor: Alignment.centerRight,
                              targetAnchor: Alignment.topCenter,
                              color: Colors.white,
                              flip: true,
                              child: ArrowElement(
                                id: '10',
                                targetId: '7',
                                sourceAnchor: Alignment.centerLeft,
                                targetAnchor: Alignment.topCenter,
                                color: Colors.white,
                                flip: true,
                                child: Positioned(
                                    top: height * (node3.y),
                                    left: width * (node3.x),
                                    child: Node(text: '3', color: startColor)),
                              ),
                            ),
                            //10
                            ArrowElement(
                              id: '05',
                              targetId: '15',
                              sourceAnchor: Alignment.centerRight,
                              targetAnchor: Alignment.topCenter,
                              color: Colors.white,
                              flip: true,
                              child: ArrowElement(
                                id: '5',
                                targetId: '0',
                                sourceAnchor: Alignment.centerLeft,
                                targetAnchor: Alignment.topCenter,
                                color: Colors.white,
                                flip: true,
                                child: Positioned(
                                  top: height * (node10.y),
                                  left: width * (node10.x),
                                  child: Node(text: '10', color: startColor),
                                ),
                              ),
                            ),
                            //5
                            ArrowElement(
                              id: '7',
                              child: Positioned(
                                top: height * (node1.y),
                                left: width * (node1.x),
                                child: Node(text: '1', color: startColor),
                              ),
                            ),
                            //7
                            ArrowElement(
                              id: '2',
                              child: Positioned(
                                top: height * (node4.y),
                                left: width * (node4.x),
                                child: Node(text: '4', color: startColor),
                              ),
                            ),
                            ArrowElement(
                              id: '15',
                              child: Positioned(
                                top: height * (node15.y),
                                left: width * (node15.x),
                                child: Node(text: '15', color: startColor),
                              ),
                            ),
                            //2

                            ArrowElement(
                              id: '0',
                              child: Positioned(
                                top: height * (node7.y),
                                left: width * (node7.x),
                                child: Node(text: '7', color: startColor),
                              ),
                            ),
                            //0
                            AnimatedPositioned(
                              top: height * (searchWalk.y) + 40,
                              left: width * (searchWalk.x),
                              duration: Duration(milliseconds: 300),
                              child: Node(
                                text: value.toString(),
                                color: searchColor,
                              ),
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
                                reverse();
                              });
                            },
                            child: Icon(Icons.backspace_sharp),
                            color: kThemeColor,
                          ),
                          RaisedButton(
                              onPressed: () {
                                setState(() {
                                  forward();
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
        ),
      ),
    );
  }
}

class Node extends StatefulWidget {
  String text;
  Color color;
  Node({this.text, this.color});
  @override
  _NodeState createState() => _NodeState();
}

class _NodeState extends State<Node> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      child: Center(
          child: Text(
        widget.color == Colors.transparent ? ' ' : widget.text,
        style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: Colors.white,
            ),
      )),
      duration: Duration(milliseconds: 500),
      height: width * 0.12,
      width: width * 0.12,
      decoration: BoxDecoration(
        color: widget.color,
        shape: BoxShape.circle,
        border: Border.all(
          color: widget.color == Colors.transparent
              ? Colors.transparent
              : Colors.white,
          width: 3,
        ),
      ),
    );
  }
}
