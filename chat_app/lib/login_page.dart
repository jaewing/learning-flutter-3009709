import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Button clicked');
        },
      ),
      //TODO: Add the text and image from the design
      /// Add backslash to allow string to recognize apostrophe as part of string.
      ///
      /// "style" property allows you to change font size, weight, etc.
      body: Text('Let\'s sign you in!', style: TextStyle()),
    );
  }
}