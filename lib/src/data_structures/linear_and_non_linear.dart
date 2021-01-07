import 'package:dsa_simulation/src/Utilities/drawer_widget.dart';
import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';

import 'package:dsa_simulation/src/Utilities/address_maninter.dart';
import 'package:dsa_simulation/src/constants.dart';

class LinearNonLinearPage extends StatefulWidget {
  @override
  _LinearNonLinearPageState createState() => _LinearNonLinearPageState();
}

class _LinearNonLinearPageState extends State<LinearNonLinearPage> {
  double initialHeight = 0.2, finalHeight = 0.4;
  @override
  void dispose() {
    // removeLast();
    super.dispose();
  }

  int currentStep = 0;
  goto(int step) {
    setState(() {
      currentStep = step;
    });
  }

  @override
  Widget build(BuildContext context) {
    path = ['Home', 'DS'];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<Step> steps = [
      Step(
        title: Text(
          'Linear',
          style: TextStyle(color: Colors.white54),
        ),
        //  state: StepState.disabled,
        content: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/ArrayPageView');
                path.add('Array');
              },
              child: Center(
                child: Text(
                  'Array',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed('/QueueNavigationPage');
                path.add('Queue');
              },
              child: Center(
                child: Text(
                  'Queue',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed('/LinkedListMainPage');
                path.add('Linked List');
              },
              child: Center(
                child: Text(
                  'Linked List',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed('/StackIntroduction');
                path.add('Stack');
              },
              child: Center(
                child: Text(
                  'Stack',
                ),
              ),
            ),
          ],
        ),
      ),
      Step(
        // state: StepState.editing,

        title: Text(
          'Non Linear',
          style: TextStyle(color: Colors.white54),
        ),
        content: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/TreeMain');
              },
              child: Center(
                child: Text(
                  'Tree',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/HeapMainPage');
              },
              child: Center(
                child: Text(
                  'Heap',
                ),
              ),
            ),
          ],
        ),
      ),
    ];
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(context, '/Home', (route) => false);
        path = ['Home'];
        return true;
      },
      child: BaseTemplate(
        body: Scaffold(
          //  drawer: DrawerWidget(),

          appBar: appBar(context),
          body: Container(
            height: height,
            width: width,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Stepper(
                    currentStep: currentStep,
                    onStepTapped: (step) {
                      setState(() {
                        goto(step);
                      });
                    },
                    steps: steps,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
