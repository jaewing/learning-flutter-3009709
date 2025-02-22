import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity entity;
  final Alignment alignment;

  const ChatBubble({Key? key, required this.alignment, required this.entity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Again we create another class instance of
    /// AuthService to call the getUserName method.
    ///
    /// Seeing now how messy this can get?
    /// Way too many redundant objects being created.
    /// Data in one state context would be overwritten
    /// by another class instance being instantiated.
    ///
    /// Because of this, we will instead implement one of
    /// the defined state management concepts that are
    /// commonly used in Flutter.
    ///
    /// Link to State Management options,
    /// https://docs.flutter.dev/data-and-backend/state-mgmt/options
    ///
    /// We will implement the "Provider" option.
    // bool isAuthor = entity.author.userName == AuthService().getUserName();
    bool isAuthor = entity.author.userName == "poojab26";

    return Align(
      alignment: alignment,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${entity.text}',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            if (entity.imageUrl != null)
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: NetworkImage(entity.imageUrl!)),
                    borderRadius: BorderRadius.circular(12)),
              )
          ],
        ),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: isAuthor ? Colors.black87 : Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12))),
      ),
    );
  }
}
