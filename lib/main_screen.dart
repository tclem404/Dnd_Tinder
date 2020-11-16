import 'package:flutter/material.dart';

class MainScreen{
  Color _backColor;
  Color _frontColor;
  Color _textColor;

  MainScreen(Color back, Color front, Color txt){
    _backColor = back;
    _frontColor = front;
    _textColor = txt;
  }

  Scaffold getPage(){
    Scaffold page;
    page = Scaffold(
      backgroundColor: _backColor,
      appBar: AppBar(
        title: Center(
          child: Text('Welcome to [Name not yet decided]', style: TextStyle(fontSize: 20, color: _textColor),),
        ),
        backgroundColor: _frontColor,
      ),
      body: Center(
        child: Image(
          image: AssetImage('icons/d20(1).png'),
          height: 300,
          width: 300,
        ),
      ),
    );

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