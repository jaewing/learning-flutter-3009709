import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  //final String username;
  const ChatPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// We use the exclamation
    /// mark to assert that it will NOT
    /// be null. Necessary because
    /// "settings" cannot be null.
    ///
    /// "settings" are the values associated with a route.
    ///
    /// This can be used in place of adding a property to
    /// the widget that you want to pass data to.
    ///
    /// "as String" is used to check to make sure data passed
    /// is of String type since that is what we are passing
    /// as an argument in "login_page.dart"
    final username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Hi $username!'),
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
              //TODO: Create a dynamic sized list
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ChatBubble(
                          alignment: index % 2 == 0
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          message: "Hi ${username}!");
                    })),
            ChatInput(),
          ],
        ),
      );
  }
}

