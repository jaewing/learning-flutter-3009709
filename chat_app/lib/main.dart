import 'package:chat_app/chat_page.dart';
import 'package:chat_app/login_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Here we define our main() loop
/// as "async" because we have an
/// instance of AuthService which
/// contains the static Future method
/// "init".
void main() async{
  //TODO: Integrate Provider for State Management
  /// Makes sure we have an instance of the
  /// widgets binding before interacting with the
  /// native code of the deployed device.
  WidgetsFlutterBinding.ensureInitialized();
  /// This is where all your initialization should
  /// happen before the app is called and rendered.
  await AuthService.init();
  runApp(Provider(
    create: (BuildContext context) => AuthService(),
    child: ChatApp(),
  ));
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App",
      theme: ThemeData(
          canvasColor: Colors.transparent,
          primarySwatch: Colors.deepPurple,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.blue, foregroundColor: Colors.black)),
      home: LoginPage(),
      routes: {'/chat': (context) => ChatPage()},
    );
  }
}
