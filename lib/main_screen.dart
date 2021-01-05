import 'package:flutter/material.dart';
import 'login.dart';

class MainScreen{
  Color _backColor;
  Color _frontColor;
  Color _textColor;

  MainScreen(Color back, Color front, Color txt){
    _backColor = back;
    _frontColor = front;
    _textColor = txt;
  }

  Scaffold getPage(BuildContext context){
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
        child: FloatingActionButton(
          child: Icon(Icons.account_circle),
          backgroundColor: Colors.red[600],
          onPressed: (() {
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new LoginSc()));
          }),
        )
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

class Mn extends StatefulWidget {
  @override
  _MnState createState() => _MnState();
}

class _MnState extends State<Mn> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
