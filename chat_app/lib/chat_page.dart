import 'dart:convert';
import 'package:chat_app/models/image_model.dart';
import 'package:http/http.dart' as http;
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
  //initiate state of messages
  List<ChatMessageEntity> _messages = [];

  _loadInitialMessages() async {
    final response = await rootBundle.loadString('assets/mock_messages.json');

    final List<dynamic> decodedList = jsonDecode(response) as List;

    final List<ChatMessageEntity> _chatMessages = decodedList.map((listItem) {
      return ChatMessageEntity.fromJson(listItem);
    }).toList();

    print(_chatMessages.length);

    //final state of the messages
    setState(() {
      _messages = _chatMessages;
    });
  }

  onMessageSent(ChatMessageEntity entity) {
    _messages.add(entity);
    setState(() {});
  }

  //TODO: Get Network Images from API
  Future<List<GirlImage>> _getNetworkImages() async {
    var endpointUrl = Uri.parse('https://gist.githubusercontent.com/hiteshsahu/f58bcca95532fde77fd0d9e94a9c3148/raw/4ef7b30240c781341f1994f12453e9e7a5c2c67d/GirlImages.json');

    final response = await http.get(endpointUrl);

    if (response.statusCode == 200) {
      ///Decode the JSON file into parent format (in this case Map).
      final Map<String, dynamic> decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
      ///Expose the 'GirlImages' key from the decodedResponse Map.
      final List<dynamic> decodedList = decodedResponse['GirlImages'] as List;

      ///Create list of GirlImage objects composed of the items
      ///from the decodedList.
      final List<GirlImage> _imageList = decodedList.map((listItem) {
        return GirlImage.fromJson(listItem);
      }).toList();

      print(_imageList[0].imageUrl);
      return _imageList;
    }
    else{
      /// We throw an Exception so we
      /// don't have a "null" return case.
      throw Exception('404 Not Found!');
    }
  }

  @override
  void initState() {
    _loadInitialMessages();
    //_getNetworkImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getNetworkImages();
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
          ///URL is NOT immediately available, only
          ///becomes available once the API call
          ///is complete. Want to only view the image
          ///in the "Future" when the image is ready.
          ///
          /// FutureBuilder widget builds a widget
          /// when the associated "future" callback
          /// is finished.
          FutureBuilder<List<GirlImage>>(
            future: _getNetworkImages(),
            ///Returns a widget.
            builder: (BuildContext context, AsyncSnapshot<List<GirlImage>> snapshot){
              if(snapshot.hasData) {
                /// Since we checked snapshot "hasData",
                /// we add an exclamation mark to tell compiler
                /// snapshot will NOT be null.
                return Image.network(snapshot.data![0].imageUrl);
              }
              else{
                return CircularProgressIndicator();
              }
            },
          ),
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
