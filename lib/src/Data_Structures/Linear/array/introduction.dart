import 'package:dsa_simulation/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:dsa_simulation/src/Utilities/address_maninter.dart';
import 'package:dsa_simulation/src/Utilities/widgets.dart';
class Element extends StatelessWidget {
  final Color color, borderColor;
  final String name;

  const Element({Key key, this.color, this.name, this.borderColor});
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
        border: Border.all(
          width: 3,
          color: borderColor,
        ),
      ),
      duration: Duration(milliseconds: 800),
      curve: Curves.ease,
    );
  }
}

class ElementIndex extends StatelessWidget {
  final Color bgColor, textColor, borderColor;
  final String text;
  const ElementIndex(
      {this.text, this.borderColor, this.bgColor, this.textColor});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.ease,
      duration: Duration(milliseconds: 800),
      padding: EdgeInsets.all(5),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: textColor,
        ),
      ),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class ArrayIntro extends StatefulWidget {
  @override
  _ArrayIntroState createState() => _ArrayIntroState();
}

class _ArrayIntroState extends State<ArrayIntro>{
  int currentState = 0;

  Color indexColor = Colors.black,
      borderColor = Colors.black,
      indexBGColor = Colors.black,
      firstColor = Colors.black,
      secondColor = Colors.black,
      thirdColor = Colors.black;
  void forwardAnimation() {
    if (currentState == 0) {
      indexBGColor = Colors.cyan; //indexColor=Colors.white;
    } else if (currentState == 1) {
      thirdColor = Colors.deepOrange;
    } else if (currentState == 2) {
      thirdColor = Colors.black;
      firstColor = Colors.deepOrange;
    } else if (currentState == 3) {
      firstColor=Colors.black;
      secondColor = Colors.deepOrange;
    }else{
      return;
    }
    currentState += 1;
  }

  void reverseAnimation() {
    if (currentState == 1) {

      indexBGColor = Colors.black;
    } else if (currentState == 2) {
      thirdColor = Colors.black;
    }
    else if(currentState ==3){
      thirdColor=Colors.deepOrange;
      firstColor = Colors.black;
    }
    else if(currentState==4){
      firstColor=Colors.deepOrange;
      secondColor=Colors.black;
    }
    else return;
    currentState -= 1;
  }
@override
  void dispose() {
    removeLast();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar(context),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Introduction to Array',
              style: Theme.of(context).textTheme.headline6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElementIndex(
                      text: 'a[0]',
                      bgColor: indexBGColor,
                      borderColor: firstColor,
                      textColor: indexColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Element(
                      borderColor: firstColor,
                      color: Colors.red,
                      name: 'John',
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElementIndex(
                      textColor: indexColor,
                      borderColor: secondColor,
                      bgColor: indexBGColor,
                      text: 'a[1]',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Element(
                      borderColor: secondColor,
                      color: Colors.blue,
                      name: 'Captain',
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElementIndex(
                      text: 'a[2]',
                      borderColor: thirdColor,
                      textColor: indexColor,
                      bgColor: indexBGColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Element(
                      name: 'Fire',
                      borderColor: thirdColor,
                      color: Colors.green,
                    ),
                  ],
                ),
              ],
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
                      });
                    },
                    child: Icon(Icons.forward),
                    color: kThemeColor,),
              ],
            ),
            Container(
              height: height * 0.3,
            )
          ],
        ),
      ),
    );
  }
}
