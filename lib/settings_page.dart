import 'package:flutter/material.dart';

//ignore this all, not worth it

class SettingsPage{
  Color _backColor;
  Color _frontColor;
  Color _textColor;

  SettingsPage(Color back, Color front, Color txt){
    _backColor = back;
    _frontColor = front;
    _textColor = txt;
  }

  Scaffold getPage(){
    Scaffold page;

    // ignore this, not worth the effort

    return page;
  }

  void setBackColor(Color col){
    _backColor = col;
  }

  void setFrontColor(Color col){
    _frontColor = col;
  }

  void setTextColor(Color col){
    _textColor = col;
  }

}