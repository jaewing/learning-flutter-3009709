import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  /// We create a final private variable here to
  /// hold the form key which is Global (same
  /// value across entire app). _formkey holds
  /// the State object of the Form widget.
  final _formkey = GlobalKey<FormState>();

  //TODO: Validate email and username values
  void loginUser() {
    /// "validate()" method validates every FormField that is a descendant
    /// of the "Form" widget. returns "True" if there are no errors among
    /// all of the FormField children of Form.
    ///
    /// Exclamation mark tells the framework that the currentState is
    /// NOT going to be null. This assertion is true because we check if
    /// currentState is null before invoking "validate()".
    if(_formkey.currentState!=null && _formkey.currentState!.validate()){
      print(userNameController.text);
      print(passwordController.text);

      print('login successful!');
    }
    else{
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

              //TODO: Add Username & Password text fields
              /// TextFormField is a drop in replacement widget for TextField.
              /// We add a parent widget "Form" to all of our TextFormField
              /// widgets we desire with a "Column" (or Row) widget in between
              /// because Form only takes one child. 
              Form(
                /// Key we created holding the State object
                /// of the "Form" widget.
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      /// Takes a callback function
                      validator: (value){
                        if(value!=null && value.isNotEmpty && value.length < 5){
                          return "Your username should be more than 5 characters.";
                        }
                        else if(value!=null && value.isEmpty){
                          return "Please type your username.";
                        }
                        /// else case
                        return null;
                      },
                      controller: userNameController,
                      decoration: InputDecoration(
                        hintText: 'Add your username',
                        hintStyle: TextStyle(color: Colors.blueGrey),
                        border: OutlineInputBorder()),
                    ),
                    /// Creating empty space between the two fields.
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Type your Password',
                        hintStyle: TextStyle(color: Colors.blueGrey),
                        border: OutlineInputBorder()),
                    ),
                  ],
                ),
              ),
              /// Creating empty space between Login button and
              /// the Password text entry box.
              SizedBox(
                height: 14,
              ),

              ElevatedButton(
                  onPressed: loginUser,
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
