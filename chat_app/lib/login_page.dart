import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  void loginUser() {
    /// "text" is a property of the TextEditingController
    /// class and holds the string entered by the user.
    print(userNameController.text);
    print(passwordController.text);
    print('login successful!');
  }

  /// Allows us to manipulate the object outside
  /// the Widget instances.
  ///
  /// Catches the "final value" of the "username" text field
  /// via the "text" property of the TextEditingController class.
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
                'https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExNHp1Ymo4YnV4ejJ4ZnF5em80NGpxanRqZm1lbG5lbTVjNnp0ZW90aiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/l3q2zVr6cu95nF6O4/giphy.webp',
                height: 200,
              ),

              //TODO: Add Username & Password text fields
              /// Allows you to accept user input via text input box.
              TextField(
                /// Controls the text being edited.
                controller: userNameController,

                /// "onChanged" called everytime user enters/deletes character.
                /// "value" holds current character string currently
                /// entered into the text box.
                ///
                /// Good for validating characters while user is
                /// typing them in.
                /*
                onChanged: (value){
                  print('value: $value');
                },
                 */
                decoration: InputDecoration(
                  /// Text that appears in box before user begins to type
                  /// to give them an idea of what to enter in the
                  /// text entry box.
                  hintText: 'Add your username.',
                  hintStyle: TextStyle(color: Colors.blueGrey),

                  /// Adds border around whole box.
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: passwordController,
                /// Places dots in place of user entry characters to
                /// prevent other people from seeing entry.
                obscureText: true,
                decoration: InputDecoration(
                  /// Text that appears in box before user begins to type
                  /// to give them an idea of what to enter in the
                  /// text entry box.
                  hintText: 'Type your password.',
                  hintStyle: TextStyle(color: Colors.blueGrey),

                  /// Adds border around whole box.
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                  onPressed: loginUser,
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                  )
              ),
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
