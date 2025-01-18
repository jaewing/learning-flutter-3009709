import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  /// Since we created a non-constant property
  /// "chatMessageController" we have to remove
  /// the "const" from ChatInput here.
  ChatInput({Key? key}) : super(key: key);

  final chatMessageController = TextEditingController();

  void onSendButtonPressed(){
    print('ChatMessage: ${chatMessageController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          //TODO: Add multi-line TextField here
          /// Need to give our TextField boundaries
          /// for what its dimensions should be between
          /// the plus sign and send sign. Expanded
          /// satisfies this.
          Expanded(
              /// We used TextField here because there is no
              /// need for input validation of the chat
              /// messages. Otherwise, if you do need input
              /// validation, use TextFormField.
              child: TextField(
                /// The following three properties combined
                /// allow our text entry to be multiline
                /// instead of one big long string.
                keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  minLines: 1,
                  controller: chatMessageController,
                  /// Only applicable to Android and iOS. Not
                  /// applicable to Web.
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Type your message',
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    /// Allows you to make text box invisible.
                    border: InputBorder.none,
                  )
              )
          ),
          IconButton(
            /// We add reference to our function.
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
