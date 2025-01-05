import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 50,
        title: Text('Hi Pooja!'),
        actions: [
          IconButton(
              onPressed: () {
                print('Icon pressed!');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      /// ListView replaces "Column" widget to allow scrolling.
      body: ListView(
        children: [
          /// Align is a good top level alignment widget.
          Align(
            alignment:Alignment.centerRight,
            child: Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                        bottomLeft: Radius.circular(12)
                    )
                ),
              ),
          ),
          /// Align is best top level alignment widget.
          Align(
            alignment:Alignment.centerRight,
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
          /// Align is best top level alignment widget.
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
          //TODO: Align both icons to the corner most edge of the device width.
          Container(
            height: 100,
            child: Row(
              /// Places each icon in the respective bottom left and
              /// bottom right corners of device screen.
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  /// Places Icon away from outer edge of screen.
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  /// Places Icon away from outer edge of screen.
                  padding: EdgeInsets.symmetric(horizontal: 20),
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
