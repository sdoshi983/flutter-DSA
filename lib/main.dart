import 'package:dsa_simulation/pages/home_page.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   AnimationController animationController;
//   Animation<Offset> offsetAnimation;
//   GlobalKey destination = GlobalKey();
//   GlobalKey source = GlobalKey();
//
//   bool forward = true;
//   Offset sourcePosition, destinationPosition, finalPosition;
//   double y;
//
//   @override
//   void initState() {
//     super.initState();
//     animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 1),
//     );
//
//     // offsetAnimation = Tween<Offset>(
//     //   begin: Offset.zero,
//     //   end: position,
//     // ).animate(CurvedAnimation(
//     //   parent: animationController,
//     //   curve: Curves.fastOutSlowIn,
//     // ));
//
//     WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     animationController.dispose();
//   }
//
//   _afterLayout(_) {
//     getPosition();
//   }
//
//   void getPosition() {
//     final RenderBox sourceRenderBox = source.currentContext.findRenderObject();
//     final RenderBox destinationRenderBox = destination.currentContext.findRenderObject();
//     destinationPosition = destinationRenderBox.localToGlobal(Offset.zero);
//     double x = destinationPosition.dx;
//     x -= 50 * 0.1;
//     destinationPosition = Offset(x, destinationPosition.dy);
//     sourcePosition = sourceRenderBox.localToGlobal(Offset.zero);
//     finalPosition = Offset((destinationPosition.dx - sourcePos
//         .dx) / 50, (destinationPosition.dy - sourcePosition.dy) / 20);
//
//     print(finalPosition);
//     // y = position.dy + 10;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         SlideTransition(
//           position: Tween<Offset>(
//             begin: Offset.zero,
//             end: finalPosition,
//             // end: Offset(0, MediaQuery.of(context).size.height / 2),
//           ).animate(animationController),
//           child: Container(
//             key: source,
//             color: Colors.white,
//             height: 20,
//             width: 50,
//           ),
//         ),
//         Row(
//
//           children: [
//             Container(
//               color: Colors.white,
//               height: 20,
//               width: 50,
//             ),
//             Spacer(),
//             SlideTransition(
//               position: Tween<Offset>(
//                 begin: Offset.zero,
//                 end: Offset(1, 0),
//               ).animate(animationController),
//               child: Container(
//                 key: destination,
//                 color: Colors.white,
//                 height: 20,
//                 width: 50,
//               ),
//             ),
//             Spacer(),
//             Container(
//               color: Colors.white,
//               height: 20,
//               width: 50,
//             ),
//           ],
//         ),
//         GestureDetector(
//           child: Container(
//             color: Colors.white,
//             height: 20,
//             width: 50,
//           ),
//           onTap: () {
//             if (forward)
//               animationController.forward();
//             else
//               animationController.reverse();
//             forward = !forward;
//           },
//         ),
//       ],
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   bool insert = false;
//   Widget text;
//   Widget before = Text(
//     "46.3",
//     style: TextStyle(
//         color: Colors.white.withOpacity(0.7),
//         decoration: TextDecoration.none,
//         fontSize: 30
//     ),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         AnimatedContainer(
//           height: 70,
//           color: Colors.green,
//           child: before,
//           duration: Duration(seconds: 25),
//           curve: Curves.fastOutSlowIn,
//
//         ),
//         SizedBox(height: 50,),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ArrayElement(
//               index: 0,
//               color: Colors.blue,
//               text: Center(
//                 child: Text(
//                   "12.56",
//                   style: TextStyle(
//                     color: Colors.white.withOpacity(0.7),
//                     decoration: TextDecoration.none,
//                       fontSize: 30
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             ArrayElement(
//               index: 1,
//               color: Colors.yellow,
//               text: Center(
//                 child: Text(
//                   "48.8",
//                   style: TextStyle(
//                     color: Colors.white.withOpacity(0.7),
//                     decoration: TextDecoration.none,
//                       fontSize: 30
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             ArrayElement(
//               index: 2,
//               color: Colors.red,
//               text: Center(
//                 child: Text(
//                   "57.3",
//                   style: TextStyle(
//                     color: Colors.white.withOpacity(0.7),
//                     decoration: TextDecoration.none,
//                       fontSize: 30
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             AnimatedContainer(
//               child: ArrayElement(
//                 index: 3,
//                 color: Colors.green,
//                 text: Center(
//                   child: text,
//                 ),
//               ),
//               duration: Duration(seconds: 5),
//               curve: Curves.fastOutSlowIn,
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 70,
//         ),
//         GestureDetector(
//           child: Container(
//             child: Text(
//               "Next",
//               style: TextStyle(
//                 color: Colors.white.withOpacity(0.7),
//                 decoration: TextDecoration.none,
//                   fontSize: 30
//               ),
//             ),
//           ),
//           onTap: (){
//             setState(() {
//               Text temp = text;
//               text=before;
//               before = temp;
//             });
//           },
//         )
//       ],
//     );
//   }
// }

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
