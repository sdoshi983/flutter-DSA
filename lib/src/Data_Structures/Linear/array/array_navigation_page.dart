import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dsa_simulation/src/constants.dart';
import 'introduction.dart';
import 'insertion.dart';
import 'deletion.dart';
class ArrayNavigator extends StatefulWidget {
  @override
  _ArrayNavigatorState createState() => _ArrayNavigatorState();
}

class _ArrayNavigatorState extends State<ArrayNavigator> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Array',
        ),
        backgroundColor: kThemeColor,
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.black,
          height: height * 0.9,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Tiles(
                onPress: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ArrayIntro(),
                    ),
                  );
                },
                title: 'Introduction',
              ),
              Tiles(
                title: 'Insertion',
                onPress: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ArrayInsert(),
                    ),
                  );
                },
              ),
              Tiles(
                onPress: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ArrayDelete(),
                    ),
                  );
                },
                title: 'Deletion',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
