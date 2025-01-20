import 'package:chat_app/models/chat_message_entity.dart';
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
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                        alignment: index % 2 == 0
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        //TODO: Add more chat & author related properties here
                        /// Here we create an object of our custom
                        /// entity class.
                        entity: ChatMessageEntity(
                          id: '1234',
                          text: 'Hello this is James!',
                          createdAt: DateTime.now().millisecondsSinceEpoch,
                          imageUrl: 'https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExeGdzMGdkbnR3cHJ5bTdhODdoaHhlcWJ0bHZnem8zaGdndnk4cjU3NyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/l3q2zVr6cu95nF6O4/giphy.gif',
                          author: Author(
                              userName: 'JamesEwing'
                          ),
                        )
                    );
                  }
              )
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
