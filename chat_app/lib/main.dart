import 'package:chat_app/chat_page.dart';
import 'package:chat_app/demo/counter_stateful_demo.dart';
import 'package:chat_app/login_page.dart';
import 'package:chat_app/widgets/Counter.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    /// Providers are above [ChatApp] instead of inside it, so that tests
    /// can use [ChatApp] while mocking the providers. Implementing with
    /// "Provider" class is best practice in order to separate the data
    /// of your State from the instance of your main execution.
    ///
    /// Use "MultiProvider" if you need multiple providers
    /// to be above ChatApp.
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: ChatApp(),
    ),
  );
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App!!!",
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: CounterStateful(buttonColor: Colors.blue),
    );
  }
}
