import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class ThemeTextStyle{
  /// Here we use the GoogleFonts class to set
  /// the font of the loginTextFieldStyle.
  ///
  /// In this case we choose the "lato" font.
  static TextStyle loginTextFieldStyle = GoogleFonts.lato(
      textStyle:  TextStyle(
          color: Colors.blueGrey
      ),
  );
}