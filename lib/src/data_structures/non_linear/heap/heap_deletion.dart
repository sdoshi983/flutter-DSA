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
  double seventyt = 0.6, eightyFivet = 0.6, fiftyt = 0.6, nintyFivet = 0.6, fourtyFivet = 0.6, sixtyt = 0.6, tent = 0.6;
  double seventyt2 = 0.6, eightyFivet2 = 0.6, fiftyt2 = 0.6, nintyFivet2 = 0.6, fourtyFivet2 = 0.6, sixtyt2 = 0.6, tent2 = 0.6;

  // left values of datas:
  double seventyl = 0.3, eightyFivel = 0.35, fiftyl = 0.4, nintyFivel = 0.45, fourtyFivel = 0.5, sixtyl = 0.55, tenl = 0.6;
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
      seventyt = 0.04;
      seventyl = 0.485;
      seventyt2 = 0.705;
      seventyl2 = 0.305;
    }
    else if(state == 1){
      eightyFivet = 0.238;
      eightyFivel = 0.235;
      eightyFivet2 = 0.705;
      eightyFivel2 = 0.355;
    }
    else if(state == 2){
      double temp = eightyFivet;
      eightyFivet = seventyt;
      seventyt = temp;

      temp = eightyFivel;
      eightyFivel = seventyl;
      seventyl = temp;

      temp = eightyFivet2;
      eightyFivet2 = seventyt2;
      seventyt2 = temp;

      temp = eightyFivel2;
      eightyFivel2 = seventyl2;
      seventyl2 = temp;

    }
    else if(state == 3){
      fiftyt = 0.235;
      fiftyl = 0.747;
      fiftyt2 = 0.705;
      fiftyl2 = 0.405;
    }
    else if(state == 4){
      nintyFivet = 0.44;
      nintyFivel = 0.137;
      nintyFivet2 = 0.705;
      nintyFivel2 = 0.455;
    }
    else if(state == 5){
      double temp = nintyFivet;
      nintyFivet = seventyt;
      seventyt = temp;

      temp = nintyFivel;
      nintyFivel = seventyl;
      seventyl = temp;

      temp = nintyFivet2;
      nintyFivet2 = seventyt2;
      seventyt2 = temp;

      temp = nintyFivel2;
      nintyFivel2 = seventyl2;
      seventyl2 = temp;

    }
    else if(state == 6){
      double temp = nintyFivet;
      nintyFivet = eightyFivet;
      eightyFivet = temp;

      temp = nintyFivel;
      nintyFivel = eightyFivel;
      eightyFivel = temp;

      temp = nintyFivet2;
      nintyFivet2 = eightyFivet2;
      eightyFivet2 = temp;

      temp = nintyFivel2;
      nintyFivel2 = eightyFivel2;
      eightyFivel2 = temp;

    }
    else if(state == 7){
      fourtyFivet = 0.44;
      fourtyFivel = 0.34;
      fourtyFivet2 = 0.705;
      fourtyFivel2 = 0.505;
    }
    else if(state == 8){
      sixtyt = 0.44;
      sixtyl = 0.635;
      sixtyt2 = 0.705;
      sixtyl2 = 0.555;
    }
    else if(state == 9){
      double temp = sixtyt;
      sixtyt = fiftyt;
      fiftyt = temp;

      temp = sixtyl;
      sixtyl = fiftyl;
      fiftyl = temp;

      temp = sixtyt2;
      sixtyt2 = fiftyt2;
      fiftyt2 = temp;

      temp = sixtyl2;
      sixtyl2 = fiftyl2;
      fiftyl2 = temp;

    }
    else if(state == 10){
      tent = 0.44;
      tenl = 0.855;
      tent2 = 0.705;
      tenl2 = 0.605;
    }
    else
      return;
    state++;
  }

  void reverse() {
    if(state == 1){
      seventyt = 0.6;
      seventyl = 0.3;
      seventyt2 = 0.6;
      seventyl2 = 0.3;
    }
    else if(state == 2){
      eightyFivet = 0.6;
      eightyFivel = 0.35;
      eightyFivet2 = 0.6;
      eightyFivel2 = 0.35;
    }
    else if(state == 3){
      double temp = eightyFivet;
      eightyFivet = seventyt;
      seventyt = temp;

      temp = eightyFivel;
      eightyFivel = seventyl;
      seventyl = temp;

      temp = eightyFivet2;
      eightyFivet2 = seventyt2;
      seventyt2 = temp;

      temp = eightyFivel2;
      eightyFivel2 = seventyl2;
      seventyl2 = temp;
    }
    else if(state == 4){
      fiftyt = 0.6;
      fiftyl = 0.4;
      fiftyt2 = 0.6;
      fiftyl2 = 0.4;
    }
    else if(state == 5){
      nintyFivet = 0.6;
      nintyFivel = 0.45;
      nintyFivet2 = 0.6;
      nintyFivel2 = 0.45;
    }
    else if(state == 6){
      double temp = nintyFivet;
      nintyFivet = seventyt;
      seventyt = temp;

      temp = nintyFivel;
      nintyFivel = seventyl;
      seventyl = temp;

      temp = nintyFivet2;
      nintyFivet2 = seventyt2;
      seventyt2 = temp;

      temp = nintyFivel2;
      nintyFivel2 = seventyl2;
      seventyl2 = temp;

    }
    else if(state == 7){
      double temp = nintyFivet;
      nintyFivet = eightyFivet;
      eightyFivet = temp;

      temp = nintyFivel;
      nintyFivel = eightyFivel;
      eightyFivel = temp;

      temp = nintyFivet2;
      nintyFivet2 = eightyFivet2;
      eightyFivet2 = temp;

      temp = nintyFivel2;
      nintyFivel2 = eightyFivel2;
      eightyFivel2 = temp;
    }
    else if(state == 8){
      fourtyFivet = 0.6;
      fourtyFivel = 0.5;
      fourtyFivet2 = 0.6;
      fourtyFivel2 = 0.5;
    }
    else if(state == 9){
      sixtyt = 0.6;
      sixtyl = 0.55;
      sixtyt2 = 0.6;
      sixtyl2 = 0.55;
    }
    else if(state == 10){
      double temp = sixtyt;
      sixtyt = fiftyt;
      fiftyt = temp;

      temp = sixtyl;
      sixtyl = fiftyl;
      fiftyl = temp;

      temp = sixtyt2;
      sixtyt2 = fiftyt2;
      fiftyt2 = temp;

      temp = sixtyl2;
      sixtyl2 = fiftyl2;
      fiftyl2 = temp;
    }
    else if(state == 11){
      tent = 0.6;
      tenl = 0.6;
      tent2 = 0.6;
      tenl2 = 0.6;
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
                    'Introduction to Heap Insertion',
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
                        Positioned(
                          top: width * 0.6,
                          left: width * 0.2,
                          child: Text(
                            'Data: ',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          top: width * seventyt,
                          left: width * seventyl,
                          duration: Duration(milliseconds: treeDuration),
                          child: Text(
                            '70',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          top: width * seventyt2,
                          left: width * seventyl2,
                          duration: Duration(milliseconds: treeDuration),
                          child: Text(
                            '70',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          top: width * eightyFivet,
                          left: width * eightyFivel,
                          duration: Duration(milliseconds: treeDuration),
                          child: Text(
                            '85',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          top: width * eightyFivet2,
                          left: width * eightyFivel2,
                          duration: Duration(milliseconds: treeDuration),
                          child: Text(
                            '85',
                            style: TextStyle(
                              color: Colors.white,
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
                          top: width * fiftyt2,
                          left: width * fiftyl2,
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
                          child: Text(
                            '95',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          top: width * nintyFivet2,
                          left: width * nintyFivel2,
                          duration: Duration(milliseconds: treeDuration),
                          child: Text(
                            '95',
                            style: TextStyle(
                              color: Colors.white,
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
                          top: width * fourtyFivet2,
                          left: width * fourtyFivel2,
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
                          top: width * sixtyt2,
                          left: width * sixtyl2,
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
                        AnimatedPositioned(
                          top: width * tent2,
                          left: width * tenl2,
                          duration: Duration(milliseconds: treeDuration),
                          child: Text(
                            '10',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        // --------------------- array ----------------------------

                        ReusableIndexText(text: '0', width: width, left: 0.3,),
                        ReusableIndexText(text: '1', width: width, left: 0.35,),
                        ReusableIndexText(text: '2', width: width, left: 0.4,),
                        ReusableIndexText(text: '3', width: width, left: 0.45,),
                        ReusableIndexText(text: '4', width: width, left: 0.5,),
                        ReusableIndexText(text: '5', width: width, left: 0.55,),
                        ReusableIndexText(text: '6', width: width, left: 0.6,),

                        ReusableArrayContainer(width: width, left: 0.3,),
                        ReusableArrayContainer(width: width, left: 0.35,),
                        ReusableArrayContainer(width: width, left: 0.4,),
                        ReusableArrayContainer(width: width, left: 0.45,),
                        ReusableArrayContainer(width: width, left: 0.5,),
                        ReusableArrayContainer(width: width, left: 0.55,),
                        ReusableArrayContainer(width: width, left: 0.6,),

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
