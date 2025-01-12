import 'package:chat_app/widgets/Counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterStateful extends StatefulWidget {
  //Widget variables should be final
  final Color buttonColor;

  CounterStateful({Key? key, required this.buttonColor}) : super(key: key);

  @override
  State<CounterStateful> createState() => _CounterStatefulState();
  /// Above and below accomplish same result.
  /*
  State<CounterStateful> createState () {
    State<CounterStateful> stateClassAssociatedWithCounterStateful =
    _CounterStatefulState();
    return stateClassAssociatedWithCounterStateful;
  }
  */
}

class _CounterStatefulState extends State<CounterStateful> {
  /*
  int counter = 0;
  void increment() {
    /// Makes sure you are NOT calling
    /// setState on an "unmounted" State.
    /// Avoids runtime crashes.
    if (mounted) {
      setState(() {
        counter++;
      });
    }
    print(counter);
  }
  */
  @override
  /// Life cycle methods
  ///
  /// First method called.
  /// Called when widget is created.
  void initState(){
    // TODO: implement initState
    super.initState();
  }
  /// Last method called.
  /// Called when widget is destroyed.
  void dispose(){
    // TODO: implement dispose
    super.dispose();
  }
  @override
  /// Once BuildContext is associated with State,
  /// the property "mounted" of State will be
  /// assigned to "True".
  ///
  /// Allows you to execute something only after
  /// the State object is successfully created.
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Counter'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: widget.buttonColor,
          child: Icon(Icons.add),
          onPressed: () {
            /// Adding "context.read.<Counter>()." as parent to increment() is
            /// necessary preserve the previous State value when using
            /// Flutter Hot Reload. Anytime you want to preserve a previous
            /// State value you need to call this in conjunction with
            /// calling "setState".
            if(mounted){
                counter.increment();
            }
          },
        ),
        body: Center(
          child: Text(
            '${counter.count}',
            style: TextStyle(fontSize: 30),
          )
        ),
    );
  }
}
