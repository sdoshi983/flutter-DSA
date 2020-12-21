import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:dsa_simulation/src/utilities/drawer_widget.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:dsa_simulation/src/utilities/widgets.dart';

import '../constants.dart';
import '../home_page.dart';
import 'address_maninter.dart';

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
  AnimationController _contontroller;
  bool _canBeDragged = false;
  void toggle() {
    _contontroller.isDismissed
        ? _contontroller.forward()
        : _contontroller.reverse();
  }

  void _onDragStart(DragStartDetails details) {
    bool fromLeft =
        _contontroller.isDismissed && details.globalPosition.dx < 200;
    print(details.globalPosition.dx);
    bool fromRigth =
        (_contontroller.isDismissed || _contontroller.isCompleted) &&
            details.globalPosition.dx > 100;
    print(fromRigth);
    print(fromLeft);
    _canBeDragged = fromLeft || fromRigth;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta / 200;
      _contontroller.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (_contontroller.isDismissed || _contontroller.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365) {
      double visual = details.velocity.pixelsPerSecond.dx / 300;
      _contontroller.fling(velocity: visual);
    } else if (_contontroller.value < 0.5) {
      _contontroller.reverse();
    } else {
      _contontroller.forward();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _contontroller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        //  onTap: toggle,
        child: AnimatedBuilder(
          animation: _contontroller,
          builder: (context, _) {
            return Stack(
              children: [
                Transform.translate(
                  offset: Offset(width * 0.8 * (-1 + _contontroller.value), 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(
                        math.pi / 10 * (1 - _contontroller.value),
                      ),
                    child: DrawerWidget(),
                  ),
                ),
                Transform.translate(
                  offset: Offset(width * 0.8 * _contontroller.value, 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, -0.001)
                      ..rotateY(math.pi / 2 * _contontroller.value),
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
