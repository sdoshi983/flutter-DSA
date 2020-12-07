import 'package:dsa_simulation/src/constants.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  //String networkImageUrl = "https://www.google.com/search?q=logo&rlz=1C1CHBF_enIN924IN924&tbm=isch&source=iu&ictx=1&fir=-eDJED2XpumqjM%252CMUnsBNeVrAyn1M%252C_&vet=1&usg=AI4_-kTVa3ZVGRC5FrUUdOqfLpByBVMw8g&sa=X&ved=2ahUKEwj92Mvv3rvtAhW14zgGHaxPBB4Q9QF6BAgOEAE#imgrc=-eDJED2XpumqjM";
  String networkImageUrl = "https://cdn.logo.com/hotlink-ok/logo-social.png";
  IconData dsIcon = Icons.arrow_right;
  IconData aIcon = Icons.arrow_right;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Drawer(
      child: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            if (dsIcon == Icons.arrow_right)
                              dsIcon = Icons.arrow_drop_down;
                            else
                              dsIcon = Icons.arrow_right;
                          });
                        },
                        child: Icon(
                          dsIcon,
                          color: kThemeColor,
                        )),
                    SizedBox(
                      width: width * 0.07,
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Text(
                        "Data Structures",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (aIcon == Icons.arrow_right)
                            aIcon = Icons.arrow_drop_down;
                          else
                            aIcon = Icons.arrow_right;
                        });
                      },
                      child: Icon(
                        aIcon,
                        color: kThemeColor,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.07,
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Text(
                        "Algorithms",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DataStructures extends StatefulWidget {
  @override
  _DataStructuresState createState() => _DataStructuresState();
}

class _DataStructuresState extends State<DataStructures> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
