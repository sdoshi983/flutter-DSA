import 'package:dsa_simulation/src/constants.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  //String networkImageUrl = "https://www.google.com/search?q=logo&rlz=1C1CHBF_enIN924IN924&tbm=isch&source=iu&ictx=1&fir=-eDJED2XpumqjM%252CMUnsBNeVrAyn1M%252C_&vet=1&usg=AI4_-kTVa3ZVGRC5FrUUdOqfLpByBVMw8g&sa=X&ved=2ahUKEwj92Mvv3rvtAhW14zgGHaxPBB4Q9QF6BAgOEAE#imgrc=-eDJED2XpumqjM";
  String networkImageUrl = "https://cdn.logo.com/hotlink-ok/logo-social.png";
  bool dataStructures = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Drawer(
      child: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.07),
                CircleAvatar(
                  backgroundImage: NetworkImage(networkImageUrl),
                  radius: 30,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  "DSA Simulation",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: kThemeColor,
                    ),
                    SizedBox(
                      width: width * 0.07,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.white,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                ReusableExpansionPanelList(
                  text: "Data Structures",
                  isExpanded: false,
                  routeName: "/LinearNonLinearPage",
                  alignment: -1,
                  child: Column(
                    children: [
                      ReusableExpansionPanelList(
                        text: "Linear",
                        isExpanded: false,
                        routeName: "/LinearDS",
                        alignment: -0.7,
                        child: Column(
                          children: [
                            ReusableExpansionPanelList(
                              text: "Array",
                              isExpanded: false,
                              child: Container(),
                              alignment: -0.5,
                              routeName: "/ArrayPageView",
                            ),
                            ReusableExpansionPanelList(
                              text: "Stack",
                              isExpanded: false,
                              routeName: '/StackMainPage',
                              alignment: -0.5,

                              child: Container(),
                            ),
                            ReusableExpansionPanelList(
                              text: "Queue",
                              isExpanded: false,
                              alignment: -0.5,

                              child: Container(),
                            ),
                            ReusableExpansionPanelList(
                              text: "Linked List",
                              isExpanded: false,
                              alignment: -0.5,

                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                      ReusableExpansionPanelList(
                        text: "Non Linear",
                        isExpanded: false,
                        alignment: -0.7,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
                ReusableExpansionPanelList(
                  text: "Algorithms",
                  isExpanded: false,
                  alignment: -1,

                  child: Container(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReusableExpansionPanelList extends StatefulWidget {
  ReusableExpansionPanelList({this.isExpanded, this.text, this.child, this.routeName, this.alignment});
  bool isExpanded;
  Widget child;
  String text, routeName;
  double alignment;
  @override
  _ReusableExpansionPanelListState createState() =>
      _ReusableExpansionPanelListState();
}

class _ReusableExpansionPanelListState
    extends State<ReusableExpansionPanelList> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Theme(
      data: Theme.of(context).copyWith(cardColor: Colors.black),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, widget.routeName);
        },
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              widget.isExpanded = !widget.isExpanded;
            });
          },
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Align(
                  alignment: Alignment(widget.alignment, 0),
                  child: Text(
                    widget.text,
                    style:
                        TextStyle(color: Colors.white, fontSize: height * 0.027
                        ),
                  ),
                );
              },
              body: widget.child,
              isExpanded: widget.isExpanded,
            ),
          ],
        ),
      ),
    );
  }
}
