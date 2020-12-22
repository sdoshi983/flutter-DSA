import 'package:flutter/material.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';

import 'package:dsa_simulation/src/constants.dart';
import 'package:dsa_simulation/src/Utilities/animation_helper.dart';
import 'package:dsa_simulation/src/Utilities/address_maninter.dart';
import 'package:dsa_simulation/src/Utilities/widgets.dart';

class QueueNavigator extends StatefulWidget {
  @override
  _QueueNavigatorState createState() => _QueueNavigatorState();
}

class _QueueNavigatorState extends State<QueueNavigator> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double h = height * 0.15, w = width * 0.1;

    return BaseTemplate(
      body: Scaffold(
        appBar: appBar(context),
        body: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Queue',
                style: Theme.of(context).textTheme.headline6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: height * 0.2,
                    width: width * 0.7,
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.white),
                        vertical: BorderSide.none,
                      ),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          QueueElement(
                            color: Colors.blue,
                          ),
                          SizedBox(width: w),
                          QueueElement(
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: w,
                          ),
                          QueueElement(
                            color: Colors.green,
                          ),
                          SizedBox(width: w),
                          QueueElement(
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text('enqueue'),
                    color: kThemeColor,
                  ),
                  RaisedButton(
                      onPressed: () {},
                      child: Text('dequeue'),
                      color: kThemeColor),
                ],
              ),
              Container(
                height: height * 0.3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QueueElement extends StatefulWidget {
  AnimationController elementController;
  Color color;
  QueueElement({this.elementController, this.color});
  @override
  _QueueElementState createState() => _QueueElementState();
}

class _QueueElementState extends State<QueueElement> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double h = height * 0.15, w = width * 0.1;

    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: h,
      width: w,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
