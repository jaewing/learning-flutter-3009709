import 'package:flutter/material.dart';

/// Type in stless and you will be given an option
/// to create a "StatelessWidget Class'
class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// From AppBar documentation,
      /// "actions" is a member of AppBar and holds a list of widgets
      /// to be displayed after the "title" widget.
      appBar: AppBar(
        /// On iOS title defaults to the center of screen.
        title: Text('Hello friend!'),
        backgroundColor: Colors.transparent,
        /// Determines opacity of the "transparency".
        /// 0 -> Transparent
        /// Higher Numbers -> Opaque
        elevation: 100,
        actions: [
          /// Need to provide a void callback function for "onPressed" and
          /// a Widget to be displayed for "icon". The are various options
          /// provided within the "Icons" class from the
          /// Material Designs library.
          IconButton(
              onPressed: () {
                print('Icon Pressed!');
              },

              /// Icon placed top right of screen.
              icon: Icon(Icons.logout)
          ),
        ],
      ),

      /// Row and Column can only fit Children as big as their parent Widget.
      /// Replace Column with ListView to allow for scrolling.
      body: ListView(
        children: [
          Container(

              /// Padding is added around the child Widget of Container.
              /// In this case it's child is "Text".
              padding: EdgeInsets.all(10),

              /// Container will automatically adjust its sizing to fit closely
              /// to the child Widget it contains, in this case 'Text'.
              child: Column(
                /// Tells Column to take on minimum size to fit Children.
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Hi this is your first text!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      )
                  ),
                  Image.network(
                    'https://media4.giphy.com/media/l3q2zVr6cu95nF6O4/giphy.gif?cid=6c09b952ksvlsl0pp4bcglqdlidiymj7996pn8wickkbg4i4&ep=v1_internal_gif_by_id&rid=giphy.gif&ct=g',
                    width: 225,
                  )
                ],
              ),
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              )
          ),
          Container(

              /// Padding is added around the child Widget of Container.
              /// In this case it's child is "Text".
              padding: EdgeInsets.all(10),

              /// Container will automatically adjust its sizing to fit closely
              /// to the child Widget it contains, in this case 'Text'.
              child: Column(
                /// Tells Column to take on minimum size to fit Children.
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Hi this is your first text!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      )),
                  Image.network(
                    'https://media4.giphy.com/media/l3q2zVr6cu95nF6O4/giphy.gif?cid=6c09b952ksvlsl0pp4bcglqdlidiymj7996pn8wickkbg4i4&ep=v1_internal_gif_by_id&rid=giphy.gif&ct=g',
                    width: 225,
                  )
                ],
              ),
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              )),
          Container(

              /// Padding is added around the child Widget of Container.
              /// In this case it's child is "Text".
              padding: EdgeInsets.all(10),

              /// Container will automatically adjust its sizing to fit closely
              /// to the child Widget it contains, in this case 'Text'.
              child: Column(
                /// Tells Column to take on minimum size to fit Children.
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Hi this is your first text!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      )),
                  Image.network(
                    'https://media4.giphy.com/media/l3q2zVr6cu95nF6O4/giphy.gif?cid=6c09b952ksvlsl0pp4bcglqdlidiymj7996pn8wickkbg4i4&ep=v1_internal_gif_by_id&rid=giphy.gif&ct=g',
                    width: 225,
                  )
                ],
              ),
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              )
          ),
          Container(

              /// Padding is added around the child Widget of Container.
              /// In this case it's child is "Text".
              padding: EdgeInsets.all(10),

              /// Container will automatically adjust its sizing to fit closely
              /// to the child Widget it contains, in this case 'Text'.
              child: Column(
                /// Tells Column to take on minimum size to fit Children.
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Hi this is your first text!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      )),
                  Image.network(
                    'https://media4.giphy.com/media/l3q2zVr6cu95nF6O4/giphy.gif?cid=6c09b952ksvlsl0pp4bcglqdlidiymj7996pn8wickkbg4i4&ep=v1_internal_gif_by_id&rid=giphy.gif&ct=g',
                    width: 225,
                  )
                ],
              ),
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              )
          ),
          Container(

              /// Padding is added around the child Widget of Container.
              /// In this case it's child is "Text".
              padding: EdgeInsets.all(10),

              /// Container will automatically adjust its sizing to fit closely
              /// to the child Widget it contains, in this case 'Text'.
              child: Column(
                /// Tells Column to take on minimum size to fit Children.
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Hi this is your first text!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      )),
                  Image.network(
                    'https://media4.giphy.com/media/l3q2zVr6cu95nF6O4/giphy.gif?cid=6c09b952ksvlsl0pp4bcglqdlidiymj7996pn8wickkbg4i4&ep=v1_internal_gif_by_id&rid=giphy.gif&ct=g',
                    width: 225,
                  )
                ],
              ),
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              )),
          Container(
            height: 50,
            child: Row(
              children: [
                IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  )
                ),
                IconButton(
                    onPressed: (){},
                    icon: Icon(
                        Icons.send,
                        color: Colors.white,
                    )
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
                //bottom: Radius.circular(20)
              ),
            ),
          )
        ],
      ),
    );
  }
}
