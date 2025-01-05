import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Align Text and image to the vertical & horizontal center of the device.
      /// Column has property called "mainAxisAlignment"
      body: Center(
        child: Column(
          /// Since applying to Column widget, aligns children on vertical axis.
          /// If Row, would align children on horizontal axis.
          /// Options: center, start, end, spaceBetween, spaceAround, spaceEvenly
          mainAxisAlignment: MainAxisAlignment.center,
          /// Alignment of opposite axis of Widget. If Widget is
          /// Column, crossAxisAlignment pertains to horizontal axis
          /// alignment within the Column.
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Let\'s sign you in!',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5),
            ),

            //TODO: Align text to center
            Text(
              'Welcome back! \n You\'ve been missed!',
              /// Alignment tool for text is the class "TextAlign"
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blueGrey),
            ),
            Image.network(
              /// Some GIFs will stop animating when pulled from url.
              /// Used a tenor parrot GIF and it stopped animating on Chrome.
              'https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExbzV1N3owd3d1dzk5bjM2MGx6Y3ZkYmRsbHJzNHk3Zjd1MWloY3FtdCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/l3q2zVr6cu95nF6O4/giphy.webp',
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
