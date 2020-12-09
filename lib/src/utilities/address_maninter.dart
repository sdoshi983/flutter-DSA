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
  void popping(int cnt, BuildContext context) {
    int count = 0;
    Navigator.popUntil(context, (route) {
      count++;
      return count == cnt;
    });
  }

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
              int len = path.length - 1;
              int curr = index;
              print(len-curr);
              popping(len - curr <= 0 ? 1: len - curr+1, context);
            },
            child: Text(
              path[index],
              style: TextStyle(color: Colors.black),
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
