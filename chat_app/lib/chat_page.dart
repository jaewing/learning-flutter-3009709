import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);
  /// Creating a method called "getChatBubble"
  ///
  /// Instead of implementing the following via a method.
  /// We create a folder in the "lib" directory called "widgets"
  /// and create a dart file in which we will put the Align
  /// widget below in to create a "Custom Widget".
  /*
  getChatBubble(alignment, message, color){
    return Align(
      /// We pass our input variable "alignment" to the Align property
      /// "alignment".
      alignment: alignment,
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              /// We set our string to display the input variable
              /// "message". First property of Text must be string,
              /// which is why we place "message" in quotes with the $
              /// special character preceding it to denote that we want to
              /// print the value of "message".
              '$message',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Image.network(
              'https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExbzV1N3owd3d1dzk5bjM2MGx6Y3ZkYmRsbHJzNHk3Zjd1MWloY3FtdCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/l3q2zVr6cu95nF6O4/giphy.webp',
              height: 200,
            )
          ],
        ),
        margin: EdgeInsets.all(50),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12))),
      ),
    );
  }
  */

  //TODOne Create reusable widgets for Chat Bubble and Chat Input
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('cool kids'),
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
            child: ListView(
              children: [
                /// Instead of calling functions here, we will instead utilize
                /// the "Custom Widget" we created located under
                /// the path lib\widgets\chat_bubble.dart
                //TODOne: Remove duplicated code
                /*
                getChatBubble(Alignment.centerRight, "Sup nerd", Colors.grey),
                getChatBubble(Alignment.centerLeft, "Yuh", Colors.lightBlue),
                getChatBubble(Alignment.centerRight, "Ligma", Colors.grey),
                */

                ChatBubble(
                    alignment: Alignment.centerRight,
                    message: "Sup nerd",
                    color: Colors.grey
                ),
                ChatBubble(
                    alignment: Alignment.centerLeft,
                    message: "Yuh",
                    color: Colors.lightBlue
                ),
                ChatBubble(
                    alignment: Alignment.centerRight,
                    message: "Ligma",
                    color: Colors.grey
                ),
              ],
            ),
          ),
          /// Moved all of the Chat Input widget content to its own dart file
          /// to create "Custom Widget".
          /// Located via path lib\widgets\chat_input.dart
          ///
          /// Making own custom widgets, provides minor performance gain
          /// and significantly increases testability.
          ChatInput()
        ],
      ),
    );
  }
}
