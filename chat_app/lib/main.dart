
/// If you are calling a class from a separate Dart file, you will need to
/// import that file as a package. You can do this in an automated manner via
/// using the Alt + Enter shortcut.
import 'package:chat_app/chat_page.dart';
import 'package:chat_app/login_page.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      //TODO: Create ChatPage() & add appBar, basic ChatBubble & ChatInput widget
      home: ChatPage(),
    );
  }
}
