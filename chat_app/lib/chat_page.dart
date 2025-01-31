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

  /// Here we create a list that holds all the messages we are pulling from
  /// JSON file.
  List<ChatMessageEntity> _messages = [];

  /// This method waits for our mock messages JSON file is loaded in as
  /// a String. We then take that String and decode it as a List. Then
  /// we structure that List with the "map" method called on decodedList
  /// and make a new List containing only ChatMessageEntity type items. We
  /// then return that ChatMessageEntity type List. Following this, we call
  /// setState and assign our imported JSON _chatMessages to our private
  /// class property _messages.
  _loadInitialMessages() async{
    final response = await rootBundle.loadString('assets/mock_messages.json');

    /// We specify concrete type check of List and cast the jsonDecode
    /// return value as a "List" to make sure runtime error is caught
    /// if the decoded response is NOT a list.
    final List<dynamic>decodedList = jsonDecode(response) as List;

    /// _chatMessages will contain a list of "ChatMessageEntity" type objects.
    /// "map" method lets you expose each item in the decodedList as "listItem"
    /// and iterate through the "listItem"s.
    final List<ChatMessageEntity> _chatMessages= decodedList.map((listItem){
      return ChatMessageEntity.fromJson(listItem);

    }).toList();
    print(_chatMessages.length);

    /// Final sate of the messages.
    setState((){
      _messages = _chatMessages;
    });
  }

  /// Call our initialize method.
  void initState(){
    _loadInitialMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// We now call this in our initState() method.
    //_loadInitialMessages();
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
                        alignment: _messages[index].author.userName == 'poojab26'
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        entity: _messages[index]
                    );
                  })),
          ChatInput(),
        ],
      ),
    );
  }
}
