/*
* Chapter 3
* Basic Building Blocks
* Building basic widgets for the login screen
 */

import 'package:chat_app/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Chat App!!!",
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: LoginPage(),
    );
  }
}

// TODO: Move LoginPage code to it's own file
// It is TODOne my liege.