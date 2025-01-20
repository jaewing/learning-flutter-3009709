import 'package:chat_app/models/chat_message_entity.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  /// This quickly will become out of hand
  /// with too many class properties to
  /// keep track of.
  ///
  /// We will instead implement the concept
  /// of modeling "entities".
  ///
  /// The basic concept is we can create a class
  /// of "entities" that we can then instantiate
  /// over and over without repeated copy and
  /// paste.
  ///
  /// Here we create a variable "entity" of
  /// ChatMessageEntity type that will allow us
  /// to hold all our class properties.
  final ChatMessageEntity entity;
  final Alignment alignment;

  const ChatBubble({Key? key, required this.entity, required this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              /// From custom entity class.
              '${entity.text}',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),

            /// Check to make sure the imageUrl is populated.
            if (entity.imageUrl != null)
              Image.network(
                /// From custom entity class.
                '${entity.imageUrl}',
                height: 200,
              )
          ],
        ),
        margin: EdgeInsets.all(50),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12))),
      ),
    );
  }
}
