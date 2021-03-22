import 'package:flutter/material.dart';

import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';
import 'package:widget_arrows/widget_arrows.dart';

import '../../../../constants.dart';

class Position {
  double x, y;
  Position({this.x, this.y});
}

class BstDeletion extends StatefulWidget {
  @override
  _BstDeletionState createState() => _BstDeletionState();
}

class _BstDeletionState extends State<BstDeletion> {
  double tipLength = 5;
  int state = 0;
  Color startColor = Colors.blue;
  List<int> inorder = [1, 3, 4, 6, 7, 10, 15];
  void forward() {}
  void reverse() {}

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    path = ['Home', 'DS', 'Trees', 'BST', 'Intro'];

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'BST Deletion',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),
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
                                top: 0,
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
                                  top: height * 0.1,
                                  left: width * 0.25,
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
                                top: height * 0.1,
                                right: width * 0.25,
                                child: Node(text: '10', color: startColor),
                              ),
                            ),
                          ),
                          //5
                          ArrowElement(
                            id: '7',
                            child: Positioned(
                              top: height * 0.2,
                              left: width * 0.15,
                              child: Node(text: '1', color: startColor),
                            ),
                          ),
                          //7
                          ArrowElement(
                            id: '2',
                            child: Positioned(
                              top: height * 0.2,
                              left: width * 0.35,
                              child: Node(text: '4', color: startColor),
                            ),
                          ),
                          //2

                          ArrowElement(
                            id: '0',
                            child: Positioned(
                              top: height * 0.2,
                              right: width * 0.35,
                              child: Node(text: '7', color: startColor),
                            ),
                          ),
                          ArrowElement(
                            id: '15',
                            child: Positioned(
                              top: height * 0.2,
                              right: width * 0.15,
                              child: Node(text: '15', color: startColor),
                            ),
                          ),
                          //0
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        height: height * 0.1,
                        width: width * 0.75,
                        child: Center(
                          child: ListView.separated(
                            itemBuilder: (BuildContext _, int index) {
                              return Item(value: inorder[index],);
                            },
                            separatorBuilder: (BuildContext _,int index){
                              return SizedBox(width: 10,);
                            },
                            itemCount: inorder.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
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

class Item extends StatefulWidget {
  int value;
  Item({this.value});
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      child: Center(child: Text(widget.value.toString())),
      height: width * 0.08,
      width: width * 0.08,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 1.5,
        ),
      ),
    );
  }
}
