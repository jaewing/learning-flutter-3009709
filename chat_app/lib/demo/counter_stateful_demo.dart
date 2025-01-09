import 'package:flutter/material.dart';

class CounterStateful extends StatefulWidget {
  /// Any properties you want to change/access outside of
  /// the _CounterStatefulState need to be declared here.
  ///
  /// This is because _CounterStatefulState is a private class only
  /// accessible from its associated StatefulWidget "CounterStateful".

  /// Value comes from parent.
  ///
  /// "widget variable"
  Color buttonColor;

  /// We removed const from constructor.
  /// Added "required" to make "buttonColor" non-nullable.
  CounterStateful({Key? key, required this.buttonColor}) : super(key: key);

  @override
  State<CounterStateful> createState() {
    State<CounterStateful> stateClassAssociatedWithThisWidget =
        _CounterStatefulState();
    return stateClassAssociatedWithThisWidget;
  }
}

class _CounterStatefulState extends State<CounterStateful> {
  /// "state variable"
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
          //TODO: Provide color from parent
          /// Since we are within the State widget and not the
          /// StatefulWidget, we need to use "widget.buttonColor"
          /// indicating the property comes from the "StatefulWidget"
          /// class associated with this "State" class we are within.
          /// "widget" refers to the parent.
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
