/*
* Chapter 3
* Basic Building Blocks
* Building basic widgets for the login screen
 */

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.yellow),
        drawer: Drawer(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
          onPressed: () {
            print('Button clicked');
          },
        ),
        //TODO: Add the text and image from the design
        /// Add backslash to allow string to recognize apostrophe as part of string.
        ///
        /// "style" property allows you to change font size, weight, etc.
        ///
        /// Column is widget that takes multiple children and can place them one after another.
        body:
        /// Replace "Column" with "Row" for the horizontal version of Column. (go figure)
        Column(
          children: [
            Text(
              'Let\'s sign you in!',
              style: TextStyle(
                fontSize: 30,
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            Center(
              child: Text('Welcome Back!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blueGrey)
              ),
            ),
            Center(
              child: Text('You have been missed!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blueGrey)
              ),
            ),
            Center(
              /// "network" is a good example of a "named constructor" in Dart.
              child: Image.network(
                'https://media4.giphy.com/media/l3q2zVr6cu95nF6O4/giphy.gif?cid=6c09b952f1w1uwjvbph3yez3f62vjz87beqwlnk79zaq2chf&ep=v1_internal_gif_by_id&rid=giphy.gif&ct=g',
                height: 400,
              ),
            ),
            /// 'Container" is a convenience widget.
            ///
            /// Allows you to add positioning properties, painting properties,
            /// constraints, padding, margin, etc.
            Center(
              child: Container(
                height: 50,
                width: 50,
                /// Move color inside "decoration" to add both color and decoration.
                //color: Colors.blue,
                /// Instead inserting dancing parrot into Container.
                //child: FlutterLogo(),
                /// Adds padding around the child element. In this case "FlutterLogo".
                padding: EdgeInsets.all(10),
                /// Adds "padding" around the Container itself.
                margin: EdgeInsets.all(100),
                /// Changes shape of widget from basic square. 
                decoration: BoxDecoration(
                    /// Inserts image within the Container.
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                            'https://media4.giphy.com/media/l3q2zVr6cu95nF6O4/giphy.gif?cid=6c09b952f1w1uwjvbph3yez3f62vjz87beqwlnk79zaq2chf&ep=v1_internal_gif_by_id&rid=giphy.gif&ct=g'
                        ),
                    ),
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        )
    );
  }
}
