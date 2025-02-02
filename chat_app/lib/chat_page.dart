import 'dart:convert';
import 'package:chat_app/models/image_model.dart';
/// Make sure to specify alias as "http" for the
/// package reference.
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

  //TODOne: Get Network Images from API
  /// Here we will connect to the API that we
  /// were testing on Postman.
  _getNetworkImages() async{
    var endpointUrl = Uri.parse('https://gist.githubusercontent.com/hiteshsahu/f58bcca95532fde77fd0d9e94a9c3148/raw/4ef7b30240c781341f1994f12453e9e7a5c2c67d/GirlImages.json7');

    ///Need to add "http" package to utilize this method.
    ///Also make sure to specify "as http" at the end to
    ///create alias to the package. We do this to avoid
    ///confusion with core Dart "get" functionality.
    ///
    /// Need to do this asynchronously with "async" paired with "await".
    ///
    /// Now we replicate what we did with handling ChatMessageEntity by
    /// decoding the JSON into a list of String<GirlImage> objects.
    ///
    /// 200 Response statusCode is "OK"
    /// 404 Response statusCode is "Error"
    final response = await http.get(endpointUrl);

    /// Check to make sure our statusCode
    /// is giving us "OK" before proceeding.
    if(response.statusCode == 200){
      /// Below is how this would be implemented if the JSON was purely
      /// of "List" formatting. For the URL I am pulling from, its a little
      /// different as it is in Map formatting.
      /*
    final List<dynamic> decodedList = jsonDecode(response.body) as List;

    final List<GirlImage> _chatMessages = decodedList.map((listItem) {
      return GirlImage.fromJson(listItem);
    }).toList();
    */
      /// Here we decode the JSON and access the "GirlImages" key.
      final Map<String, dynamic> decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
      final List<dynamic> decodedList = decodedResponse['GirlImages'] as List;

      /// Here we map each item in the list to a GirlImage object.
      final List<GirlImage> _imageList = decodedList.map((listItem){
        return GirlImage.fromJson(listItem);
      }).toList();

      /// "body" will give you the JSON response.
      print(_imageList[0].imageUrl);
    }

    else{
      print('404 Not Found!');
    }

  }

  @override
  void initState() {
    _loadInitialMessages();
    /// Here we call our API method.
    //_getNetworkImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// We add our API method here so we
    /// can do hot reload.
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
