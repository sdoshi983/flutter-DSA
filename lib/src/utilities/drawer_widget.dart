import 'package:dsa_simulation/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:auto_animated/auto_animated.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  //String networkImageUrl = "https://www.google.com/search?q=logo&rlz=1C1CHBF_enIN924IN924&tbm=isch&source=iu&ictx=1&fir=-eDJED2XpumqjM%252CMUnsBNeVrAyn1M%252C_&vet=1&usg=AI4_-kTVa3ZVGRC5FrUUdOqfLpByBVMw8g&sa=X&ved=2ahUKEwj92Mvv3rvtAhW14zgGHaxPBB4Q9QF6BAgOEAE#imgrc=-eDJED2XpumqjM";
  String networkImageUrl = "https://cdn.logo.com/hotlink-ok/logo-social.png";
  bool dataStructures = false;



  List<ReusableExpansionPanelList> mainList = [
    ReusableExpansionPanelList(
      text: "Data Structures",
      isExpanded: false,
      routeName: "/LinearNonLinearPage",
      alignment: -1,
      child: LiveListOptions(itemCount: 2, list: dataStructuresList,),
    ),
    ReusableExpansionPanelList(
      text: "Algorithms",
      isExpanded: false,
      alignment: -1,
      child: Container(),
    )
  ];

  static List<ReusableExpansionPanelList> dataStructuresList = [
    ReusableExpansionPanelList(
      text: "  Linear",
      isExpanded: false,
      routeName: "/LinearDS",
      alignment: -0.7,
      child: LiveListOptions(itemCount: 4, list: linearList,),
    ),
    ReusableExpansionPanelList(
      text: "  Non Linear",
      isExpanded: false,
      alignment: -0.7,
      child: Container(),
    ),
  ];

  static List<ReusableExpansionPanelList> linearList = [
    ReusableExpansionPanelList(
      text: "    Array",
      isExpanded: false,
      child: Container(),
      alignment: -0.5,
      routeName: "/ArrayPageView",
    ),
    ReusableExpansionPanelList(
      text: "    Stack",
      isExpanded: false,
      routeName: '/StackMainPage',
      alignment: -0.5,
      child: Container(),
    ),
    ReusableExpansionPanelList(
      text: "    Queue",
      isExpanded: false,
      alignment: -0.5,
      child: Container(),
    ),
    ReusableExpansionPanelList(
      text: "    Linked List",
      isExpanded: false,
      alignment: -0.5,
      child: Container(),
    ),
  ];
  

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Drawer(
      child: Container(
        height: height,
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
                  height: height * 0.02,
                ),
                SingleChildScrollView(child: LiveListOptions(itemCount: 2, list: mainList,)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReusableExpansionPanelList extends StatefulWidget {
  ReusableExpansionPanelList(
      {this.isExpanded, this.text, this.child, this.routeName, this.alignment});
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
        onTap: () {
          Navigator.of(context).pop();
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
                  alignment: Alignment(-1, 0),
                  child: Text(
                    widget.text,
                    style: TextStyle(
                        color: Colors.white, fontSize: height * 0.027),
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

class LiveListOptions extends StatefulWidget {
  LiveListOptions({this.itemCount, this.list});
  List<ReusableExpansionPanelList> list;
  int itemCount;
  @override
  _LiveListOptionsState createState() => _LiveListOptionsState();
}

class _LiveListOptionsState extends State<LiveListOptions> {

  final options = LiveOptions(
    // Start animation after (default zero)
    delay: Duration(milliseconds: 1),

    // Show each item through (default 250)
    showItemInterval: Duration(milliseconds: 100),

    // Animation duration (default 250)
    showItemDuration: Duration(milliseconds: 500),

    // Animations starts at 0.05 visible
    // item fraction in sight (default 0.025)
    visibleFraction: 0.05,

    // Repeat the animation of the appearance
    // when scrolling in the opposite direction (default false)
    // To get the effect as in a showcase for ListView, set true
    reAnimateOnVisibility: false,
  );

  @override
  Widget build(BuildContext context) {
    return LiveList.options(
        shrinkWrap: true,
        options: options,
        itemCount: widget.itemCount,
        itemBuilder: (BuildContext context, int index,
            Animation<double> animation) {
          return FadeTransition(
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animation),
            child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, -0.1),
                  end: Offset.zero,
                ).animate(animation),
                child: widget.list[index]),
          );
        });
  }
}
