import 'package:flutter/material.dart';

List<String> path = ['Home'];
void addElement(String addMe) {
   path.add(addMe);
}

void removeLast() {
//  path.removeLast();
}

class AddressBar extends StatefulWidget {
  @override
  _AddressBarState createState() => _AddressBarState();
}

class _AddressBarState extends State<AddressBar> {


  @override
  void initState() {
  //  print(path);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
  //  print('============> Inside Address Maintainer length of the appbar ${path.length}');
    return Container(
      width: w * 0.8,
      child: ListView.separated(
        itemCount: path.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
     //     print(index);
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
                } else if (path[index] == 'Singly') {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/SinglyMainPage', (route) => false);
                } else if (path[index] == 'Doubly') {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/DoublyMainPage', (route) => false);
                }
                else if(path[index]=='Trees'){
                  Navigator.pushNamedAndRemoveUntil(context, '/TreeMain', (route) => false);
                }
              });
            },
            child: Text(
              index >= path.length ? "ERROR" : path[index],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Text(' > ');
        },
        //  itemCount: path.length,
      ),
    );
  }
}
