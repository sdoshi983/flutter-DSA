import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';
import 'package:dsa_simulation/src/utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:widget_arrows/arrows.dart';
import 'package:widget_arrows/widget_arrows.dart';

import '../../../constants.dart';

class HeapDeletion extends StatefulWidget {
  @override
  _HeapDeletionState createState() => _HeapDeletionState();
}

class _HeapDeletionState extends State<HeapDeletion> {

  // top values of datas:
  double seventyt = 0.44, eightyFivet = 0.238, fiftyt = 0.44, nintyFivet = 0.04, fourtyFivet = 0.44, sixtyt = 0.235, tent = 0.44;
  double seventy= 1, eightyFive = 1, fifty = 1, nintyFive = 1, fourtyFivet2 = 0.6, sixtyt2 = 0.6, tent2 = 0.6;

  // left values of datas:
  double seventyl = 0.137, eightyFivel = 0.235, fiftyl = 0.635, nintyFivel = 0.485, fourtyFivel = 0.34, sixtyl = 0.747, tenl = 0.855;
  double seventyl2 = 0.3, eightyFivel2 = 0.35, fiftyl2 = 0.4, nintyFivel2 = 0.45, fourtyFivel2 = 0.5, sixtyl2 = 0.55, tenl2 = 0.6;

  int treeDuration = 700;

  double tipLength = 10;
  double dataOpacity = 1;
  bool elementVisible = false;
  int state = 0;
  Color first = Colors.transparent,
      second = Colors.transparent,
      rest = Colors.transparent;

  TextStyle textStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

  void forward() {
    if(state == 0){
      nintyFive = 0;
      tent = nintyFivet;
      tenl = nintyFivel;
    }
    else if(state == 1){
      double temp = eightyFivet;
      eightyFivet = tent;
      tent = temp;

      temp = eightyFivel;
      eightyFivel = tenl;
      tenl = temp;
    }
    else if(state == 2){
      double temp = seventyt;
      seventyt = tent;
      tent = temp;

      temp = seventyl;
      seventyl = tenl;
      tenl = temp;
    }
    else if(state == 3){
      eightyFive = 0;
      fiftyt = eightyFivet;
      fiftyl = eightyFivel;
    }
    else if(state == 4){
      double temp = seventyt;
      seventyt = fiftyt;
      fiftyt = temp;

      temp = seventyl;
      seventyl = fiftyl;
      fiftyl = temp;
    }
    else if(state == 5){
      double temp = fourtyFivet;
      fourtyFivet = fiftyt;
      fiftyt = temp;

      temp = fourtyFivel;
      fourtyFivel = fiftyl;
      fiftyl = temp;
    }
    else if(state == 6){
      seventy = 0;
      fiftyt = seventyt;
      fiftyl = seventyl;
    }
    else if(state == 7){
      double temp = sixtyt;
      sixtyt = fiftyt;
      fiftyt = temp;

      temp = sixtyl;
      sixtyl = fiftyl;
      fiftyl = temp;
    }

    else
      return;
    state++;
  }

  void reverse() {
    if(state == 1){
      nintyFive = 1;
      tent = 0.44;
      tenl = 0.855;
    }
    else if(state == 2){
      double temp = eightyFivet;
      eightyFivet = tent;
      tent = temp;

      temp = eightyFivel;
      eightyFivel = tenl;
      tenl = temp;
    }
    else if(state == 3){
      double temp = seventyt;
      seventyt = tent;
      tent = temp;

      temp = seventyl;
      seventyl = tenl;
      tenl = temp;
    }
    else if(state == 4){
      eightyFive = 1;
      fiftyt = 0.44;
      fiftyl = 0.635;
    }
    else if(state == 5){
      double temp = seventyt;
      seventyt = fiftyt;
      fiftyt = temp;

      temp = seventyl;
      seventyl = fiftyl;
      fiftyl = temp;
    }
    else if(state == 6){
      double temp = fourtyFivet;
      fourtyFivet = fiftyt;
      fiftyt = temp;

      temp = fourtyFivel;
      fourtyFivel = fiftyl;
      fiftyl = temp;

    }
    else if(state == 7){
      seventy = 1;
      fiftyt = 0.44;
      fiftyl = 0.34;
    }
    else if(state == 8){
      double temp = sixtyt;
      sixtyt = fiftyt;
      fiftyt = temp;

      temp = sixtyl;
      sixtyl = fiftyl;
      fiftyl = temp;
    }

    else
      return;
    state--;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    path = ['Home', 'DS', 'Heaps', 'Deletion'];
    //print('introduction');
    // print(path);
    print("inside heap");
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, '/HeapMainPage', (route) => false);
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
                    'Introduction to Heap Deletion',
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
                              dataOpacity: elementVisible ? 1 : 0,
                              color: Colors.red,
                              title: '',
                              left: width * 0.45,
                            ),
                          ),
                        ),
                        ArrowElement(
                          color: Colors.white,
                          tipLength: tipLength,
                          id: '06',
                          targetId: '3',
                          sourceAnchor: Alignment.centerRight,
                          targetAnchor: Alignment.topCenter,
                          flip: true,
                          child: ArrowElement(
                            color: Colors.white,
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
                          color: Colors.white,
                          child: ArrowElement(
                            id: '5',
                            targetId: '2',
                            tipLength: tipLength,
                            targetAnchor: Alignment.topCenter,
                            sourceAnchor: Alignment.centerLeft,
                            flip: true,
                            color: Colors.white,
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

                        // ------------------------------- Data --------------------------------

                        AnimatedPositioned(
                          top: width * seventyt,
                          left: width * seventyl,
                          duration: Duration(milliseconds: treeDuration),
                          child: AnimatedOpacity(
                            opacity: seventy,
                            duration: Duration(milliseconds: treeDuration),
                            child: Text(
                              '70',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          top: width * eightyFivet,
                          left: width * eightyFivel,
                          duration: Duration(milliseconds: treeDuration),
                          child: AnimatedOpacity(
                            opacity: eightyFive,
                            duration: Duration(milliseconds: treeDuration),
                            child: Text(
                              '85',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          top: width * fiftyt,
                          left: width * fiftyl,
                          duration: Duration(milliseconds: treeDuration),
                          child: Text(
                            '50',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          top: width * nintyFivet,
                          left: width * nintyFivel,
                          duration: Duration(milliseconds: treeDuration),
                          child: AnimatedOpacity(
                            opacity: nintyFive,
                            duration: Duration(milliseconds: treeDuration),
                            child: Text(
                              '95',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          top: width * fourtyFivet,
                          left: width * fourtyFivel,
                          duration: Duration(milliseconds: treeDuration),
                          child: Text(
                            '45',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          top: width * sixtyt,
                          left: width * sixtyl,
                          duration: Duration(milliseconds: treeDuration),
                          child: Text(
                            '60',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          top: width * tent,
                          left: width * tenl,
                          duration: Duration(milliseconds: treeDuration),
                          child: Text(
                            '10',
                            style: TextStyle(
                              color: Colors.white,
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

class ReusableIndexText extends StatefulWidget {
  String text;
  double width, left;
  ReusableIndexText({this.text, this.width, this.left});
  @override
  _ReusableIndexTextState createState() => _ReusableIndexTextState();
}

class _ReusableIndexTextState extends State<ReusableIndexText> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.width * 0.65,
      left: widget.width * (widget.left + 0.01),
      child: Container(
        child: Text(widget.text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),

      ),
    );
  }
}

class ReusableArrayContainer extends StatefulWidget {
  double width, left;
  ReusableArrayContainer({this.width, this.left});
  @override
  _ReusableArrayContainerState createState() => _ReusableArrayContainerState();
}

class _ReusableArrayContainerState extends State<ReusableArrayContainer> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.width * 0.7,
      left: widget.width * widget.left,
      child: Container(
        child: Text('70', style: TextStyle(color: Colors.white.withOpacity(0)),),
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
