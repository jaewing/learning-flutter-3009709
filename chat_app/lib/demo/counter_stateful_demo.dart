import 'package:flutter/material.dart';


/// StatefulWidget widgets are composed of both a StatefulWidget
/// class and a State class.
class CounterStateful extends StatefulWidget {
  //Widget variables should be final
  final Color buttonColor;

  CounterStateful({Key? key, required this.buttonColor}) : super(key: key);

  @override
  State<CounterStateful> createState() => _CounterStatefulState();
}

/// Looking at the documentation for State you can see that
/// it is able to be any type that "extends" StatefulWidget.
/// This ability is made possible by specifying a "generic"
/// type. Upon implementation here, we have a State class of
/// concrete type "CounterStateful".
///
/// CounterStateful == T extends StatefulWidget
///
class _CounterStatefulState extends State<CounterStateful> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
    print(counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Counter'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: widget.buttonColor,
          child: Icon(Icons.add),
          onPressed: () {
            increment();
          },
        ),
        body: Center(
          child: Text(
            '$counter',
            style: TextStyle(fontSize: 30),
          ),
        ));
  }
}
