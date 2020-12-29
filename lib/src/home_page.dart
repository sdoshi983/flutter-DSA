import 'dart:async';
import 'package:dsa_simulation/src/utilities/base_template.dart';
import 'package:dsa_simulation/src/Utilities/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:dsa_simulation/route_generator.dart';
import 'package:slimy_card/slimy_card.dart';
import '../src/constants.dart';
import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:dsa_simulation/src/Utilities/address_maninter.dart';
import 'package:auto_animated/auto_animated.dart';
import 'dart:math' as math;
import 'package:animations/animations.dart';


double max(double a, double b) {
  if (a > b) return a;
  return b;
}

List data = ['Array', 'Linked List', 'Queue', 'Stack'];
List algo = ['Searching', 'Sorting', 'Dynamic Programming'];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BaseTemplate(
      body: Scaffold(
        //  drawer: DrawerWidget(),
        appBar: appBar(context),
        body: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            color: Colors.black,
            child: ListView(
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                SlimyCard(
                  color: Colors.white,
                  width: width * 0.85,
                  topCardHeight: max(150, height * 0.1),
                  bottomCardHeight: max(200, height * 0.15),
                  borderRadius: 20,
                  topCardWidget: MainButton(
                    onPress: () {
                      addElement('DS');
                      Navigator.of(context)
                          .pushReplacementNamed('/LinearNonLinearPage');
                    },
                    title: ' ',
                    imagePath: 'assets/images/ds.jpeg',
                  ),
                  bottomCardWidget: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Center(
                          child: Text(
                            data[index],
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      );
                    },
                    itemCount: 4,
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                SlimyCard(
                  color: Color(0xFF1837E8),
                  width: width * 0.85,
                  topCardHeight: max(150, height * 0.1),
                  bottomCardHeight: max(200, height * 0.15),
                  borderRadius: 20,
                  topCardWidget: MainButton(
                    onPress: () {
                      addElement('ALGO');
                      Navigator.of(context)
                          .pushReplacementNamed('/LinearNonLinearPage');
                    },
                    imagePath: 'assets/images/algo.jpeg',
                    title: 'ALGO',
                  ),
                  bottomCardWidget: Container(
                    height: max(200, height * 0.15),
                    color: kThemeColor,
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Searching',
                          style:
                          Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          'Sorting',
                          style:
                          Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          'Dynamic Programming',
                          style:
                          Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  final String title;
  final Function onPress;
  final String imagePath;
  const MainButton({this.title, this.onPress, this.imagePath});
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        // color: Colors.black,
        width: w * 0.9,
        height: max(h * 0.1, 150),
        child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline2,
            )),
      ),
    );
  }
}