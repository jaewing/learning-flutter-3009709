
import 'package:chat_app/main.dart';
import 'package:flutter/material.dart';

//TODO: Recreate the counter app

/// Stateful widget shortcut is typing in "stful"
///
/// Stateful widget is a abstract class with a abstract method.
///
/// Need to declare a class as "abstract" to be able to have abstract
/// methods within that class.
///
/// An "abstract method" is a method without implementation (aka empty).
///
/// The default abstract method of StatefulWidget is "createState" in which
/// every class extending StatefulWidget has to @override.
///
class CounterStateful extends StatefulWidget {

  const CounterStateful({Key? key}) : super(key: key);

  @override
  /// Upon overriding the compiler expects implementation of a "State" class.
  ///
  /// "State<CounterStateful>" links the generic class "State" to the "CounterStateful"
  /// widget.
  ///
  /// "State<CounterStateful>" is the State class type for the
  /// CounterStateful widget and creates an instance of this class via overriding
  /// the 'createState()' method which returns an instance "_CounterStatefulState".
  ///
  /// _CounterStatefulState is therefore the "State" instance for the CounterStateful
  /// widget containing all its State data.
  ///
  /// This can be re-written for clarity as below,
  //State<CounterStateful> createState() => _CounterStatefulState();

  ///Both above and below achieve same thing.
  State<CounterStateful> createState() {

    State<CounterStateful> stateClassAssociatedWithThisWidget =
      _CounterStatefulState();
    return stateClassAssociatedWithThisWidget;
  }

}

/// This class is always a part of a Stateful Widget.
class _CounterStatefulState extends State<CounterStateful> {
  /// This is considered our "state value".
  int counterValue = 0;

  void incrementValue(){
    /// We update the UI via wrapping our logic with the
    /// "setState" method.
    ///
    /// setState takes a function as an argument.
    ///
    /// setState re-runs the "build" method with new state values.
    ///
    /// Only available for classes who are subclass to the "State" class.
    setState((){
      counterValue++;
    });
    print('$counterValue');
  }

  @override
  /// BuildContext is the handle to the location of a widget in the
  /// widget tree for your app. Tells you the location of widget in tree.
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          incrementValue();
        },
      ),
      body: Center(
        child: Text('$counterValue',
        style: TextStyle(fontSize: 30),
        ),
      )
    );
  }
}
