import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Hi $username!'),
        actions: [
          IconButton(
              onPressed: () {
                /// Using "maybePop" instead of "pop"
                /// will prevent you from popping the
                /// last "route" on the stack.
                // Navigator.maybePop(context);
                // print('Icon pressed!');
                /// "popAndPushNamed" pushes the route you
                /// specify and then completely disposes of
                /// the previous route. Perfect for the
                /// case of "logging out" of account.
                ///
                /// '/' is the named route for the "home" page you
                /// specified in "main.dart"
                Navigator.popAndPushNamed(context, '/');
                print('Icon pressed!');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              //TODO: Create a dynamic sized list
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                        alignment: index % 2 == 0
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        message: "Hello, this is Pooja!");
                  })),
          ChatInput(),
        ],
      ),
    );
  }
}
