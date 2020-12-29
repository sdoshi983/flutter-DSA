import 'package:animations/animations.dart';
import 'package:dsa_simulation/src/Data_Structures/Linear/Stack/Introduction.dart';
import 'package:dsa_simulation/src/Data_Structures/Linear/Stack/stack_mainPage.dart';
import 'package:dsa_simulation/src/Data_Structures/Linear/linked_list/Singly/singly_introduction.dart';
import 'package:dsa_simulation/src/Data_Structures/Linear/linked_list/Singly/singly_deletion.dart';
import 'package:dsa_simulation/src/Data_Structures/Linear/linked_list/Singly/singly_insertion.dart';
import 'package:dsa_simulation/src/Data_Structures/Linear/linked_list/Singly/singly_main_page.dart';
import 'package:dsa_simulation/src/Data_Structures/Linear/linked_list/linked_list_main_page.dart';
import 'package:dsa_simulation/src/data_structures/linear/linked_list/doubly/doubly_deletion.dart';
import 'package:dsa_simulation/src/data_structures/linear/linked_list/doubly/doubly_main_page.dart';
import 'package:dsa_simulation/src/data_structures/linear/queue/q_navigation.dart';
import 'package:dsa_simulation/src/data_structures/linear_and_non_linear.dart';
import 'package:dsa_simulation/src/home_page.dart';
import 'src/data_structures/linear/linear.dart';
import 'src/Data_Structures/Linear/array/array_navigation_page.dart';
import 'package:flutter/material.dart';
import 'src/data_structures/linear/linked_list/doubly/doubly_introduction.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/Home':
        return reusablePageRouteBuilder(HomePage());
      case '/LinearNonLinearPage':
        return reusablePageRouteBuilder(LinearNonLinearPage());
      case '/LinearDS':
        return reusablePageRouteBuilder(LinearDS());
      case '/QueueNavigationPage':
        return reusablePageRouteBuilder(QueueNavigator());
      case '/ArrayPageView':
        return reusablePageRouteBuilder(ArrayNavigator());
      case '/StackMainPage':
        return reusablePageRouteBuilder(StackMainPage());
      case '/StackIntroduction':
        return reusablePageRouteBuilder(StackIntroduction());
      case '/LinkedListMainPage':
        return reusablePageRouteBuilder(LinkedListMainPage());
      case '/SinglyMainPage':
        return reusablePageRouteBuilder(SinglyMainPage());
      case '/DoublyMainPage':
        return reusablePageRouteBuilder(DoublyMainPage());
      case '/SinglyIntroductionPage':
        return reusablePageRouteBuilder(SinglyIntroduction());
      case '/SinglyInsertionPage':
        return reusablePageRouteBuilder(SinglyInsertion());
      case '/SinglyDeletionPage':
        return reusablePageRouteBuilder(SinglyDeletion());
      case '/DoublyIntroductionPage':
        return reusablePageRouteBuilder(DoublyIntroduction());
      case '/DoublyDeletionPage':
        return reusablePageRouteBuilder(DoublyDeletion());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return reusablePageRouteBuilder(
          Scaffold(
            body: SafeArea(
              child: Center(
                child: Text(
                  'Route Error',
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
}

PageRouteBuilder<dynamic> reusablePageRouteBuilder(Widget page) {
  SharedAxisTransitionType _transitionType =
      SharedAxisTransitionType.horizontal;

  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
    return page;
  }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
    var begin = Offset(0.0, 1.0);
    var end = Offset.zero;
    var curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    return SharedAxisTransition(
      child: child,
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      transitionType: _transitionType,
    );
  });
}
