import 'package:chat_app/chat_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();

  void loginUser(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);

      Navigator.push(
          /// Here we have to provide an argument for our ChatPage constructor
          /// since we required a "username" property to be specified. We
          /// pull the username from the userNameController property so its
          /// passed onto the ChatPage when its pushed.
          context,
          MaterialPageRoute(
              builder: (context) =>
              /// This is a simple example.
              /// We can pass whole objects to another route
              /// which could be extremely useful.
                  ChatPage(username: userNameController.text)
          )
      );
      print('login successful!');
    } else {
      print('not successful!');
    }
  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

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
                'https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExeGdzMGdkbnR3cHJ5bTdhODdoaHhlcWJ0bHZnem8zaGdndnk4cjU3NyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/l3q2zVr6cu95nF6O4/giphy.gif',
                height: 200,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 5) {
                          return "Your username should be more than 5 characters";
                        } else if (value != null && value.isEmpty) {
                          return "Please type your username";
                        }
                        return null;
                      },
                      controller: userNameController,
                      decoration: InputDecoration(
                          hintText: 'Add your username',
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Type your password',
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          border: OutlineInputBorder()),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                  onPressed: () {
                    loginUser(context);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                  )),
              GestureDetector(
                onTap: () {
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
