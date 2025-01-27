import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  /// Here we specify a concrete type for
  /// our list to make sure we don't
  /// populate it with an items that are
  /// NOT of "ChatMessageEntity" type.
  List<ChatMessageEntity> _messages = [
    ChatMessageEntity(
      id: '1234',
      text: 'first text',
      createdAt: DateTime.now().millisecondsSinceEpoch,
      author: Author(userName: 'James'),
      imageUrl: "https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExeGdzMGdkbnR3cHJ5bTdhODdoaHhlcWJ0bHZnem8zaGdndnk4cjU3NyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/l3q2zVr6cu95nF6O4/giphy.gif"
    ),
    ChatMessageEntity(
      id: '1234',
      text: 'second text',
      createdAt: DateTime.now().millisecondsSinceEpoch,
      author: Author(userName: 'Emily'),
      imageUrl: "https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExeGdzMGdkbnR3cHJ5bTdhODdoaHhlcWJ0bHZnem8zaGdndnk4cjU3NyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/l3q2zVr6cu95nF6O4/giphy.gif"
    ),
    ChatMessageEntity(
      id: '1234',
      text: 'third text',
      createdAt: DateTime.now().millisecondsSinceEpoch,
      author: Author(userName: 'James'),
      imageUrl: "https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExeGdzMGdkbnR3cHJ5bTdhODdoaHhlcWJ0bHZnem8zaGdndnk4cjU3NyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/l3q2zVr6cu95nF6O4/giphy.gif"
    )
  ];
  //TODO: Create mock list
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
                Navigator.pushReplacementNamed(context, '/');
                print('Icon pressed!');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                        alignment: _messages[index].author.userName == 'James'
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        entity: _messages[index],
                    );
                  })),
          ChatInput(),
        ],
      ),
    );
  }
}
