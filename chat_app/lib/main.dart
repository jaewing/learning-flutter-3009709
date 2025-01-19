import 'package:chat_app/chat_page.dart';
import 'package:chat_app/login_page.dart';
import 'package:chat_app/utils/brand_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App",
      theme: ThemeData(
          /// This is the new way of implementing primarySwatch in Material 3
          /// package. Use colorScheme instead of primarySwatch.
          colorScheme: ColorScheme.fromSeed(seedColor: BrandColor.primaryColor),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.blue, foregroundColor: Colors.black)),
      home: LoginPage(),
      routes: {'/chat': (context) => ChatPage()},
    );
  }
}
