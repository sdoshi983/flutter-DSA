import 'package:dsa_simulation/src/home_page.dart';
import 'package:dsa_simulation/route_generator.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'src/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: kThemeColor,
        accentColor: Color(0xff6200EE),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
        ),
      ),
      home: HomePage(),
    );
  }
}

class ArrayElement extends StatefulWidget {
  Color color;
  int index;
  Widget text;
  ArrayElement({this.color, this.index, this.text});

  @override
  _ArrayElementState createState() => _ArrayElementState();
}

class _ArrayElementState extends State<ArrayElement> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "a[" + widget.index.toString() + "]",
          style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: 30),
        ),
        SizedBox(
          height: 1,
        ),
        AnimatedContainer(
          color: widget.color,
          child: widget.text,
          height: 70,
          duration: Duration(seconds: 5),
        ),
      ],
    );
  }
}
