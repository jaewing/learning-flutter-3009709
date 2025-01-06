import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Hi Pooja!'),
        actions: [
          IconButton(
              onPressed: () {
                print('Icon pressed!');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          /// ListView needs a fixed height, so we wrap it with Flexible.
          /// Dynamically (upon call) calculates a fixed value for the ListView window.
          /// Widget gives you options to change how the child widget fills
          /// available space on screen in axis of top level Column, Row, or Flex widget.
          ///
          /// Here we change "Flexible" to "Expanded" because it better suits
          /// the behaviour we want for the display of chat messages.
          ///
          /// "Expanded" extends "Flexible" and sets "flex" == 1 and "fit"
          /// == FlexFit.tight
          Expanded(
            /// changing the flex value here affects how the child
            /// ListView will interact with other widgets with a
            /// Flexible parent. In this case, we wrapped the chat
            /// entry box with Flexible and therefore will interact
            /// with that.
            flex: 1,
            child: ListView(
              children: [
            
                //TODO: Remove duplicated code
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Hi, this is your message!',
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
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12))),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Hi, this is your message!',
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
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12))),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Hi, this is your message!',
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
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12))),
                  ),
                ),
            
                //TODO: Make it sticky
                /// We want the chat input should stay on screen in same spot
                /// when scrolling through messages.
              ],
            ),
          ),
          /// If Flexible widget A's "flex" integer value is larger
          /// it will take more available space than a Flexible widget B with a
          /// smaller integer "flex" value.
          /// The "fit" determines how the widget fits the space that flex has
          /// allocated for it. "tight" will expand the widget to fill the
          /// available space. "loose" retains the original widget size within
          /// the available space allocated by flex. "Respects" child size when
          /// you set "loose", overrides child size when you set "tight".
          ///
          /// "Expanded" is a version of Flexible that by default has "flex"
          /// == 1 and "fit" == FlexFit.tight
          ///
          /// Expanded not good here since we want the chat input to stay same
          /// size we set with a height of 100.
          ///
          /// If you want to keep Flexible widget, you can set "flex" to zero or
          /// null to have same behaviour as Flexible not wrapping child widget.
          Container(
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
                IconButton(
                  onPressed: () {},
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
          )
        ],
      ),
    );
  }
}
