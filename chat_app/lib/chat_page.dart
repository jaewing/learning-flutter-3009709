import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  /// By adding this as a property to ChatPage,
  /// we are able to pass this variable and its
  /// value from one route to another.
  final String username;

  const ChatPage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //TODOne: Remove harcoded name here
        title: Text('Chat with ${username}!'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                print('Icon pressed!');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              //TODOne: Create a dynamic sized list
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
