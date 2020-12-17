import 'package:flutter/material.dart';

// solution to getting global variables, janky but it works fine
class Vari{
  static Color _backColor = Colors.white10;
  static Color _frontColor = Colors.red[600];
  static Color _textColor = Colors.white;
  static bool _signedIn = false;

  static Color getBackColor(){
    return _backColor;
  }

  static Color getFrontColor(){
    return _frontColor;
  }

  static Color getTextColor(){
    return _textColor;
  }

  static bool getSignedIn(){
    return _signedIn;
  }

  static void setSignedIn(){
    _signedIn = !_signedIn;
  }
}