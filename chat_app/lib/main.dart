import 'package:chat_app/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chat App",
      /// primarySwatch gradually being phased out by Flutter devs.
      /// Use colorScheme instead.
      theme: ThemeData(
          colorScheme: ColorScheme(
              brightness: Brightness.dark,
              primary: Colors.deepPurple,
              onPrimary: Colors.black,
              secondary: Colors.purple,
              onSecondary: Colors.black,
              error: Colors.red,
              onError: Colors.white,
              surface: Colors.white38,
              onSurface: Colors.black,
          ),
      ),
      home: LoginPage(),
    );
  }
}
