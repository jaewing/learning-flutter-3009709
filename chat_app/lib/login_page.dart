import 'package:chat_app/utils/spaces.dart';
import 'package:chat_app/utils/textfield_styles.dart';
import 'package:chat_app/widgets/login_text_field.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();
  /// argument you pass launchUrl method must be of
  /// "Uri" type.
  final Uri _url = Uri.parse('https://www.youtube.com/');


    void loginUser(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);

      Navigator.pushReplacementNamed(context, '/chat',
          arguments: '${userNameController.text}');
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
              Image.asset(
                'assets/illustration.png',
                height: 200,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    LoginTextField(
                      hintText: "Enter your username",
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
                    ),
                    verticalSpacing(24),
                    LoginTextField(
                      hasAsterisks: true,
                      controller: passwordController,
                      hintText: 'Enter your password',
                    ),
                  ],
                ),
              ),
              verticalSpacing(24),
              ElevatedButton(
                  onPressed: () {
                    loginUser(context);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                  )),
              GestureDetector(
                onTap: () async{
                  //todo: Navigate to browser
                  /// Here we will implement the use of an external
                  /// plugin called "url_launcher" from pub.dev.
                  ///
                  /// This plugin is able to do a whole host of
                  /// things including sending SMS, email, making
                  /// phone call, etc. in addition to opening URLs.
                  ///
                  /// "launchUrl" requires a "Uri" type variable
                  /// to be assigned. Previous implementation was
                  /// "launch" and could accept a String. This is
                  /// no longer true.
                  ///
                  /// Note that we added the "async" keyword to our
                  /// onTap callback. This is a necessary pairing
                  /// with the "await" keyword. await keyword is a
                  /// declarative way of defining an asynchronous
                  /// function. "await" can only be used within
                  /// an asynchronous function "async".
                  if(!await launchUrl(_url)){
                    throw Exception('Could not launch $_url');
                  }
                  print('Link clicked!');
                },
                child: Column(
                  children: [
                    Text('Find us on'),
                    Text('$_url'),
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
