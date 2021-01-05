import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';
import 'package:dsa_simulation/src/utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:widget_arrows/arrows.dart';
import 'package:widget_arrows/widget_arrows.dart';

class TreeIntroduction extends StatefulWidget {
  @override
  _TreeIntroductionState createState() => _TreeIntroductionState();
}

class _TreeIntroductionState extends State<TreeIntroduction> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    path = ['Home', 'DS', 'Trees', 'Intro'];
    print('introduction');
    print(path);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, '/TreeMain', (route) => false);
        return true;
      },
      child: BaseTemplate(
        body: Scaffold(
          appBar: appBar(context),
          body: Container(
            color: Colors.black,
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Introduction to Tree',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.white),
                ),
                Container(
                  child: Stack(
                    children: [
                      ArrowElement(
                        color: Colors.white,
                        bow: 0,
                        sourceAnchor: Alignment.bottomCenter,
                        targetAnchor: Alignment.topCenter,
                        id: '01',
                        targetId: '3',
                        child: TreeNode(
                          id: '1',
                          targetId: '2',
                          color: Colors.red,
                          title: '1',
                          left: width * 0.45,
                          source: Alignment.bottomCenter,
                          target: Alignment.topCenter,
                        ),
                      ),
                      TreeNode(
                        id: '2',
                        color: Colors.green,
                        title: '2',
                        top: width * 0.2,
                        left: width * ((1 / 3) - 0.05),
                      ),
                      TreeNode(
                        id: '3',
                        color: Colors.blue,
                        title: '3',
                        top: width * 0.2,
                        left: width * ((2 / 3) - 0.05),
                      ),
                    ],
                  ),
                  width: width,
                  height: height * 0.6,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TreeNode extends StatelessWidget {
  String title, id, targetId;
  Color color;
  Alignment source, target;
  double top = 100, left = 0;
  TreeNode(
      {this.color,
      this.title,
      this.id,
      this.targetId,
      this.source,
      this.target,
      this.top,
      this.left});
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return ArrowElement(
      color: Colors.white,
      straights: false,
      bow: 0,
      id: id,
      targetId: targetId,
      sourceAnchor: source,
      targetAnchor: target,
      child: Positioned(
        top: top,
        left: left,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 600),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 3),
          ),
          child: CircleAvatar(
            radius: w * 0.05,
            backgroundColor: color,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
