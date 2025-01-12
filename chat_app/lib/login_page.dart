import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  void loginUser() {
    print('login successful!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Let\'s sign you in!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),
              Text(
                'Welcome back! \n You\'ve been missed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.blueGrey),
              ),
              Image.network(
                'https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExNHp1Ymo4YnV4ejJ4ZnF5em80NGpxanRqZm1lbG5lbTVjNnp0ZW90aiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/l3q2zVr6cu95nF6O4/giphy.webp',
                height: 200,
              ),
              ElevatedButton(
                  onPressed: loginUser,
                  child: Text(
                    'Click me!',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                  )),
              //TODO: Add the supporting text by final design
              /// Tap and Gesture detection.
              /// Widgets: GestureDetector and InkWell
              ///
              /// Both Text and the Text URL Button should
              /// both react to a user "tap".
              ///
              /// We accomplish this via wrapping both Text widgets with a
              /// Column and then a GestureDetector widget.
              ///
              /// InkWell gives you the "splash" effect of a button being
              /// tapped to give user feedback they tapped the right button.
              InkWell(
                splashColor: Colors.grey,
                onLongPress: (){
                  print('long pressed!');
                },
                onDoubleTap: (){
                  print('double tapped!');
                },
                onTap: (){
                  //todo: Navigate to browser
                  print('Link clicked!');
                },
                child: Column(
                  children: [
                    Text('Find us on'),
                    Text('https://poojabhaumik.com'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
