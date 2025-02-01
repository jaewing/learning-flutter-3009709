import 'dart:convert';

import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  /// Code restaurant example.
  /// It would look something like below in
  /// idea.
  //waiter.getmenu();
  //waite.getTodaySpecialDish();


  //initiate state of messages
  List<ChatMessageEntity> _messages = [];

  /// Here we have an example of an async function.
  _loadInitialMessages() async {
    /// If we remove "await" keyword error occurs because
    /// loadString returns an object of "Future<String>" type.
    /// "Future" type is a result of an async computation.
    ///
    /// "await" tells the future function "loadString"
    /// to wait until it gets the "final" string
    /// result only. Otherwise "loadString" would
    /// return a Future<String> type object.
    ///
    /// Entire code block inside the "then" method would go
    /// below the await line for that implementation.
    //final String response = await rootBundle.loadString('assets/mock_messages.json');

    /// JavaScript style way.
    ///
    /// Able to nest ".then" methods.
    rootBundle.loadString('assets/mock_messages.json').then((response){
      final List<dynamic> decodedList = jsonDecode(response) as List;

      final List<ChatMessageEntity> _chatMessages = decodedList.map((listItem) {
        return ChatMessageEntity.fromJson(listItem);
      }).toList();

      print(_chatMessages.length);

      //final state of the messages
      setState(() {
        _messages = _chatMessages;
      });
    }).then((_){
      /// This will execute after the above ".then" method
      /// is finished executing.
      print('done!');
    });
    /// ".then" method jumps immediately to next line which
    /// would be this print statement while it begins
    /// asynchronous execution of the code inside the
    /// ".then" callback.
    print('I executed while the above is running asynchronously within the "then" method.');
  }

  onMessageSent(ChatMessageEntity entity) {
    _messages.add(entity);
    setState(() {});
  }

  @override
  void initState() {
    _loadInitialMessages();
    super.initState();
  }

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
                        alignment:
                            _messages[index].author.userName == 'poojab26'
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                        entity: _messages[index]);
                  })),
          ChatInput(
            onSubmit: onMessageSent,
          ),
        ],
      ),
    );
  }
}
