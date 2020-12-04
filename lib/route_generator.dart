import 'package:dsa_simulation/pages/data_structures/linear_and_nonLinear.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){

      case '/LinearNonLinearPage':
        return MaterialPageRoute(builder: (_) => LinearNonLinearPage());
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}