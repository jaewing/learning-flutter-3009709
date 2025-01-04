import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Button clicked');
        },
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'Let\'s sign you in!',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5),
            ),
          ),
          Center(
            child: Text(
              'Welcome back! \n You\'ve been missed!',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blueGrey),
            ),
          ),
          Image.network(
            'https://media4.giphy.com/media/l3q2zVr6cu95nF6O4/giphy.gif?cid=6c09b952ksvlsl0pp4bcglqdlidiymj7996pn8wickkbg4i4&ep=v1_internal_gif_by_id&rid=giphy.gif&ct=g',
            height: 200,
          ),
          Container(
            height: 150,
            width: 150,
            // child: FlutterLogo(),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                      'https://media4.giphy.com/media/l3q2zVr6cu95nF6O4/giphy.gif?cid=6c09b952ksvlsl0pp4bcglqdlidiymj7996pn8wickkbg4i4&ep=v1_internal_gif_by_id&rid=giphy.gif&ct=g'),
                ),
                color: Colors.blue,
                borderRadius: BorderRadius.circular(24)),
          )
        ],
      ),
    );
  }
}
