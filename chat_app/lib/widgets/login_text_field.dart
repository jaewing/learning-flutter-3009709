import 'package:chat_app/utils/textfield_styles.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  //final InputDecoration deezNuts;
  final FormFieldValidator<String>? validator;
  final bool hasAsterisks;


  /// If we define required properties for our
  /// Custom widget that override the properties
  /// of the widget we return. It enforces you
  /// to define certain properties upon object
  /// instantiation.
  const LoginTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      //required this.deezNuts,
      this.validator,
      this.hasAsterisks = false})
      : super(key: key);

  @override
  Widget build(BuildContext context){
    return TextFormField(
      /// Since we assign a property of TextFormField
      /// to our Custom property "hasAsterisks". This
      /// allows us to change the value of our custom
      /// property to change our obscureText state for
      /// each TextFormField widget instance.
      obscureText: hasAsterisks,
      /// Replaced previous logic with dynamic check.
      validator: (value) {
        if(validator!= null) {
          /// Since we already checked if value is null.
          /// We assert with ! that it will NOT be null.
          return validator!(value);
        }
      },
      /// Required properties don't have to be defined here.
      /// But if NOT defined here, must be defined upon
      /// object creation.
      controller: controller,
      decoration: InputDecoration(
          hintText: 'Add your username',
          hintStyle: ThemeTextStyle.loginTextFieldStyle,
          border: OutlineInputBorder()),
    );
  }

}