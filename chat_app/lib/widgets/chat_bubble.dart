import 'package:chat_app/models/chat_message_entity.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity entity;
  final Alignment alignment;

  const ChatBubble({Key? key, required this.alignment, required this.entity})
      : super(key: key);



  @override
  Widget build(BuildContext context) {

    /// Used to change color of each bubble
    /// appropriately depending on user.
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
              //TODO: Make image rounded
              Container(
                height: 250,
                ///Width of parent (device screen).
                //width: MediaQuery.of(context).size.width,
                ///Container has built image formatting
                ///capabilities via the image property
                ///and the DecorationImage class. No need
                ///for child widget of Container.
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(entity.imageUrl!),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(24)
                ),
              )
          ],
        ),
        //TODOne: Reduce padding
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(

            //TODO: Update color depending on current author
            /// One liner conditional statement checking if
            /// isAuthor bool value. If true, color is set
            /// to primaryColor. Else, color is set to Colors.black87.
            color: isAuthor ?  Colors.black87 : Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12))),
      ),
    );
  }
}
