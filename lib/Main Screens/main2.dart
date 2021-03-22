import 'package:dnd_tinder/matches.dart';
import 'package:flutter/material.dart';
import '../Database/login.dart';
import '../settings.dart';
import '../matches.dart';
import '../vari.dart';
import '../color_page.dart';
import '../messages.dart';
import 'package:provider/provider.dart';
import '../Database/user.dart';
import '../Database/database.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Vari.getBackColor(),
        appBar: AppBar(
          leading: Container(),
          title: Center(
            child: Text('Welcome to [Name not yet decided]', style: TextStyle(fontSize: 20, color: Vari.getTextColor()),),
          ),
          backgroundColor: Vari.getFrontColor(),
        ),
        body: Container(
          child: Column(
              children: [
                Text('Navigation', style: TextStyle(fontSize: 25, color: Vari.getTextColor())),
                Text(" ", style: TextStyle(fontSize: 20),),
                RaisedButton(
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Vari.getTextColor(),),
                      Text('       Matches', style: TextStyle(fontSize: 18, color: Vari.getTextColor()),)
                    ],
                  ),
                  color: Colors.red[600],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                  onPressed: (() {
                    // Function to move to a screen, just replace 'MatchesSc' with you Stateless/ful widget to use in THIS widget
                    if(Vari.getSignedIn()) {
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => new MatchesSc()));
                    }else{
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => buildPopupDialog(context, 'Error', 'You must be signed in to view Matches'),
                      );
                    }
                  }),
                ),
                Text(" ", style: TextStyle(fontSize: 20),), // Just spacing, need new solution Eventually, not now
                RaisedButton(
                  child: Row(
                    children: [
                      Icon(Icons.settings, color: Vari.getTextColor(),),
                      Text('       Settings', style: TextStyle(fontSize: 18, color: Vari.getTextColor()),)
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
                        builder: (BuildContext context) => buildPopupDialog(context, 'Error', 'You must be signed in to edit Account Settings'),
                      );
                    }
                  }),
                ),
                Text(" ", style: TextStyle(fontSize: 20),),
                RaisedButton(
                  child: Row(
                    children: [
                      Icon(Icons.account_circle, color: Vari.getTextColor(),),
                      Text('       Account', style: TextStyle(fontSize: 18, color: Vari.getTextColor()),)
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
                        Icon(Icons.format_paint, color: Vari.getTextColor()),
                        Text('          Theme', style: TextStyle(fontSize: 18, color: Vari.getTextColor()),)
                      ],
                    ),
                    color: Colors.red[600],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                    onPressed: (() {
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new ColorScreen()));
                    })
                ),
                Text(" ", style: TextStyle(fontSize: 20),),
                RaisedButton(
                    child: Row(
                      children: [
                        Icon(Icons.message, color: Vari.getTextColor()),
                        Text('          Messages', style: TextStyle(fontSize: 18, color: Vari.getTextColor()),)
                      ],
                    ),
                    color: Colors.red[600],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                    onPressed: (() {
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new MessageSc()));
                    })
                )
              ]
          ),
          padding: EdgeInsets.fromLTRB(110, 100, 110, 15),
        ),
    );
  }
}
