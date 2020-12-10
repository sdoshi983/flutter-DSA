
import 'package:flutter/material.dart';
Offset getPositions(GlobalKey a) {
  final RenderBox renderBox = a.currentContext.findRenderObject();
  final position = renderBox.localToGlobal(Offset.zero);
 // print("POSITION : $position ");
  return position;
}

Size getSizes(GlobalKey a) {
  final RenderBox renderBox = a.currentContext.findRenderObject();
  final size = renderBox.size;
 // print("SIZE : $size");
  return size;
}