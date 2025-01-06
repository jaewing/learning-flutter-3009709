import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  /// Add properties here.
  final Alignment alignment;
  final String message;
  final Color color;

  /// Must add properties to constructor.
  /// If you don
  const ChatBubble({Key? key, required this.alignment, required this.message, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      /// We create a property of ChatBubble called "alignment" of
      /// type "Alignment" to be able to set the Align property
      /// alignment's value.
      alignment: alignment,
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              /// We set our string to display the input variable
              /// "message". First property of Text must be string,
              /// which is why we place "message" in quotes with the $
              /// special character preceding it to denote that we want to
              /// print the value of "message".
              '$message',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Image.network(
              'https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExbzV1N3owd3d1dzk5bjM2MGx6Y3ZkYmRsbHJzNHk3Zjd1MWloY3FtdCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/l3q2zVr6cu95nF6O4/giphy.webp',
              height: 200,
            )
          ],
        ),
        margin: EdgeInsets.all(50),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12))),
      ),
    );
  }
}
