import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Hi Pooja!'),
        actions: [
          IconButton(
              onPressed: () {
                print('Icon pressed!');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            //TODO: Create a dynamic sized list
            /// Both itemCount and itemBuilder will be dynamically
            /// initialized in future via database and data sources.
            child: ListView.builder(
                /// Number of times you want widget to be rendered.
                itemCount: 10,
                /// Widget you want to instantiate multiple times.
                itemBuilder: (context, index) {
              return ChatBubble(
                /// If index is even, centerLeft
                /// Else index is odd, centerRight
                alignment: index % 2 == 0
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
                message: "Hello, this is Pooja!",
              );
            }
            )

            /// Manually creating ChatBubble instances over and over is not an
            /// efficient method of accomplishing this task. Especially in the
            /// context of the possibility of thousands of messages needed to
            /// be handled.
            // child: ListView(
            //   children: [
            //     ChatBubble(
            //         alignment: Alignment.centerLeft,
            //         message: "Hello, this is Pooja!"),
            //     ChatBubble(
            //         alignment: Alignment.centerRight,
            //         message: "Hello, this is Pooja!"),
            //   ],
            // ),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
