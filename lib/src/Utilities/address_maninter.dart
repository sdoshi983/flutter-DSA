import 'package:flutter/material.dart';

List<String> path = ['Home'];
void addElement(String addMe) {
  path.add(addMe);
}

void removeLast() {
  path.removeLast();
}

class AddressBar extends StatefulWidget {
  @override
  _AddressBarState createState() => _AddressBarState();
}

class _AddressBarState extends State<AddressBar> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w * 0.8,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              print("ok");
            },
            child: Text(
              path[index],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Text(' > ');
        },
        itemCount: path.length,
      ),
    );
  }
}
