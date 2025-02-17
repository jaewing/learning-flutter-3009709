import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/picker_body.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  final Function(ChatMessageEntity) onSubmit;

  ChatInput({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  /// Default state is empty since most cases we
  /// will not have an image to attach.
  String _selectedImageUrl = '';

  final chatMessageController = TextEditingController();

  void onSendButtonPressed() {
    print('ChatMessage: ${chatMessageController.text}');
    final newChatMessage = ChatMessageEntity(
        text: chatMessageController.text,
        id: "244",
        createdAt: DateTime.now().millisecondsSinceEpoch,
        author: Author(userName: 'poojab26'));

    /// Check to make sure user selected image.
    if(_selectedImageUrl.isNotEmpty)
          newChatMessage.imageUrl = _selectedImageUrl;

    //TODO: Check for image, and append it to the chat object
    widget.onSubmit(newChatMessage);

      /// Clears state of the Chat input box.
      chatMessageController.clear();
      /// Set the selected Image Url back to empty string.
      _selectedImageUrl = '';
      setState(() {});
  }

  /// Function we pass to the "onImageSelected" property
  /// in child widget "picker_body".
  void onImagePicked(String newImageUrl){
    setState(() {
      /// newImageUrl passed by child "picker_body".
      _selectedImageUrl = newImageUrl;
    });

    /// Closes the select image window after
    /// you selected the image you want to
    /// send.
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      /// By removing the height constraint here,
      /// we allow the Container to resize dynamically.
      //height: MediaQuery.of(context).size.height * 0.25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return NetworkImagePickerBody(
                      onImageSelected: onImagePicked,);
                  });
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          Expanded(
              /// Here we wrap TextField with Column widget
              /// to allow us to place an image widget along
              /// the vertical axis with the text.
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              minLines: 1,
              controller: chatMessageController,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: "Type your message",
                  hintStyle: TextStyle(color: Colors.blueGrey),
                  border: InputBorder.none),
            ),
                if (_selectedImageUrl.isNotEmpty)
                  Image.network(_selectedImageUrl, height: 200),
              ])),
          IconButton(
            onPressed: onSendButtonPressed,
            icon: Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    );
  }
}
