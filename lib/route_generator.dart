import 'package:dsa_simulation/src/data_structures/linear_and_non_linear.dart';
import 'src/data_structures/linear/linear.dart';
import 'src/Data_Structures/Linear/array/array_pageview.dart';
import 'package:flutter/material.dart';
class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){

      case '/LinearNonLinearPage':
        return MaterialPageRoute(builder: (_) => LinearNonLinearPage());
      case '/LinearDS':
        return MaterialPageRoute(builder: (_)=>LinearDS());
      case '/ArrayPageView':
        return MaterialPageRoute(builder:(_)=>ArrayPageView());

      default:
      // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}