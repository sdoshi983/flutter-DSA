import 'package:flutter/material.dart';

List<String> path = ['Home'];
void addElement(String addMe) {
  path.add(addMe);
}

void removeLast() {
 // path.removeLast();
}

List pathFinder(String ele) {
  if (ele == '/Home') {
    path = ['Home'];
    // print('in');
  } else if (ele == '/LinearNonLinearPage') {
    path = ['Home', 'DS'];
  } else if (ele == 'Algo') {
    path = ['Home', 'Algo'];
  } else if (ele == '/ArrayPageView') {
    path = ['Home', 'DS', 'Array'];
  } else if (ele == '/QueueNavigationPage') {
    path = ['Home', 'DS', 'Queue'];
  } else if (ele == '/LinkedListMainPage') {
    path = ['Home', 'DS', 'Linked List'];
  } else if (ele == '/StackIntroduction') {
    path = ['Home', 'DS', 'Stack'];
  }
  return path;
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
              setState(() {
                if (path[index] == 'Home') {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/Home', (route) => false);
                  //   Navigator.pushNamed(context, '/Home');
                  path = ['Home'];
                  // print('in');
                } else if (path[index] == 'DS') {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/LinearNonLinearPage', (route) => false);
                  path = ['Home', 'DS'];
                } else if (path[index] == 'Algo') {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/LinearNonLinearPage', (route) => false);
                  path = ['Home', 'Algo'];
                } else if (path[index] == 'Array') {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/ArrayPageView', (route) => false);
                  path = ['Home', 'DS', 'Array'];
                } else if (path[index] == 'Queue') {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/QueueNavigationPage', (route) => false);
                  path = ['Home', 'DS', 'Queue'];
                } else if (path[index] == 'Linked List') {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/LinkedListMainPage', (route) => false);
                  path = ['Home', 'DS', 'Linked List'];
                } else if (path[index] == 'Stack') {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/StackIntroduction', (route) => false);
                  path = ['Home', 'DS', 'Stack'];
                } else {
                  //  print("ok");
                  int len = path.length - 1;
                  int curr = index;
                  //       print(len - curr);
                  popping(len - curr <= 0 ? 1 : len - curr + 1, context);
                }
              });
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
