import 'package:dnd_tinder/matches.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'settings.dart';
import 'matches.dart';
import 'vari.dart';
import 'theme_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  MyAppHome createState() => MyAppHome();
}

class MyAppHome extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    // use Vari Class to get front, back, and text colors

    //Don't touch, needed for Navigator
    return MaterialApp(
      // The Slides
      home: new HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget{

  //Stateless as it is unchanging for now, and needed to be stateless for HomeScreen, may cause issues later
  @override
  Widget build(BuildContext context) {
    Color _backColor = Colors.white10;
    Color _frontColor = Colors.red[600];
    Color _textColor = Colors.white;

    return Scaffold(
      backgroundColor: _backColor,
      appBar: AppBar(
        title: Center(
          child: Text('Welcome to [Name not yet decided]', style: TextStyle(fontSize: 20, color: _textColor),),
        ),
        backgroundColor: _frontColor,
      ),
      body: Container(
        child: Column(
            children: [
              Text('Navigation', style: TextStyle(fontSize: 25, color: _textColor)),
              Text(" ", style: TextStyle(fontSize: 20),),
              RaisedButton(
                child: Row(
                  children: [
                    Icon(Icons.search, color: _textColor,),
                    Text('       Matches', style: TextStyle(fontSize: 18, color: _textColor),)
                  ],
                ),
                color: Colors.red[600],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                onPressed: (() {
                  // Function to move to a screen, just replace 'MatchesSc' with you Stateless/ful widget to use in THIS widget
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new MatchesSc()));
                }),
              ),
              Text(" ", style: TextStyle(fontSize: 20),), // Just spacing, need new solution Eventually, not now
              RaisedButton(
                child: Row(
                  children: [
                    Icon(Icons.settings, color: _textColor,),
                    Text('       Settings', style: TextStyle(fontSize: 18, color: _textColor),)
                  ],
                ),
                color: Colors.red[600],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                onPressed: (() {
                  if(Vari.getSignedIn()){
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new SettingsSc()));
                  }else{
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => buildPopupDialog(context, 'You must be signed in to edit Account Settings'),
                    );
                  }
                }),
              ),
              Text(" ", style: TextStyle(fontSize: 20),),
              RaisedButton(
                child: Row(
                  children: [
                    Icon(Icons.account_circle, color: _textColor,),
                    Text('       Account', style: TextStyle(fontSize: 18, color: _textColor),)
                  ],
                ),
                color: Colors.red[600],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                onPressed: (() {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new LoginSc()));
                }),
              ),
              Text(" ", style: TextStyle(fontSize: 20),),
              RaisedButton(
                child: Row(
                  children: [
                    Text('          Theme', style: TextStyle(fontSize: 18, color: _textColor),)
                  ],
                ),
                color: Colors.red[600],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                onPressed: (() {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new ThemeSc()));
                })
              )
            ]
          ),
        padding: EdgeInsets.fromLTRB(110, 100, 110, 15),
      ),
    );
  }
}