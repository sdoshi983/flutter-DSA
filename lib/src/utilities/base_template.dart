import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:dsa_simulation/src/utilities/drawer_widget.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:dsa_simulation/src/utilities/widgets.dart';

import '../constants.dart';
import '../home_page.dart';
import 'address_maninter.dart';
AnimationController baseController;
void toggle() {
  baseController.isDismissed
      ? baseController.forward()
      : baseController.reverse();
}
double max(double a, double b) {
  if (a > b) return a;
  return b;
}

class BaseTemplate extends StatefulWidget {
  Widget body;
  BaseTemplate({this.body});
  @override
  _BaseTemplateState createState() => _BaseTemplateState();
}

class _BaseTemplateState extends State<BaseTemplate>
    with SingleTickerProviderStateMixin {
  bool _canBeDragged = false;


  void _onDragStart(DragStartDetails details) {
    bool fromLeft =
        baseController.isDismissed && details.globalPosition.dx < 200;
  //  print(details.globalPosition.dx);
    bool fromRigth =
        (baseController.isDismissed || baseController.isCompleted) &&
            details.globalPosition.dx > 100;
  //  print(fromRigth);
   // print(fromLeft);
    _canBeDragged = fromLeft || fromRigth;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta / 200;
      baseController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (baseController.isDismissed || baseController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365) {
      double visual = details.velocity.pixelsPerSecond.dx / 300;
      baseController.fling(velocity: visual);
    } else if (baseController.value < 0.5) {
      baseController.reverse();
    } else {
      baseController.forward();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    baseController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.black,
      child: GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        //  onTap: toggle,
        child: AnimatedBuilder(
          animation: baseController,
          builder: (context, _) {
            return Stack(
              children: [
                Transform.translate(
                  offset: Offset(width * 0.82 * (-1 + baseController.value), 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.002)
                      ..rotateY(
                        math.pi / 10 * (1 - baseController.value),
                      ),
                    child: DrawerWidget(),
                  ),
                ),
                Transform.translate(
                  offset: baseController.value<0.1?Offset.zero: Offset(width * 0.8 * baseController.value -10, 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, -0.002)
                      ..rotateY(math.pi / 2 * baseController.value),
                    child: widget.body,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
