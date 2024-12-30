import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

// TODO Create ChatApp widget
// TODO Create LoginPage widget

// Declare a class called "ChatApp" that extends the StatelessWidget class.
class ChatApp extends StatelessWidget{
  /// New way using Dart v2.17 or higher.
  //const ChatApp({super.key});
  /// Old way.
  const ChatApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Flutter Chat App!!",
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  /// This is called the "super-parameters" language feature.
  ///
  /// It is the new way of accomplishing what is shown in LIL videos.
  /// New way using Dart v2.17 or higher.
  //const LoginPage({super.key});

  /// Old way.
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        //backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Button clicked');
        },
      ),
      body: Text('Hello!'),
    );
  }
}
