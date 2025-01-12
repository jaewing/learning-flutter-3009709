import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  void loginUser() {
    print('login successful!');
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).primaryColor;
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

              /// Three types of Buttons.
              /// ElevatedButton
              //TODOne: Add Login Button
              ElevatedButton(
                  /// If we assign "onPressed: null" it would disable
                  /// the Button.
                  ///
                  /// In future the button state should depend on the
                  /// "Form" widgets.
                  ///
                  /// onPressed requires a "void" type function.
                  onPressed: loginUser,
                  child: Text(
                    'Click me!',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                  )),

              /// OutlinedButton
              //OutlinedButton(onPressed: (){}, child: FlutterLogo()),
              /// TextButton

              //TODOne: Add URL Text Button
              TextButton(
                  onPressed: () {
                    print('Pressed on the URL!');
                  },
                  child: Text('https://poojabhaumik.com')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
