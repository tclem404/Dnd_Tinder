import 'package:dnd_tinder/matches.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'settings.dart';
import 'matches.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  MyAppHome createState() => MyAppHome();
}

class MyAppHome extends State<MyApp> {
  // This widget is the root of your application.
  int _slide = 0;

  // Settings for Character
  bool _homeBrew = false;
  bool _dm = false;
  String _class = 'None';

  //Settings for cosmetics, ill get around to it
  Color _backColor = Colors.white10;
  Color _frontColor = Colors.red[600];
  Color _textColor = Colors.white;

  //Sign-in stuff
  bool _signedIn = false;

  //Tabs for App
  /* LoginPage page = new LoginPage(Colors.white10, Colors.red[600], Colors.white);
  MainScreen mainSc = new MainScreen(Colors.white10, Colors.red[600], Colors.white);

  var tabs = [
    Scaffold(),Scaffold(),Scaffold(),Scaffold()
  ];

  // just some random comments to tests commits with github
  //ignore these
  String onRun(BuildContext _context){
    tabs[0] = mainSc.getPage(context);
    tabs[1] = Scaffold(
      backgroundColor: Colors.white10,
        body: Center(child: Text('Matches', style: TextStyle(color: Colors.white, fontSize: 30),))
    );
    tabs[2] = Scaffold(
      backgroundColor: Colors.white10,
      body: Column(
        children: [
          Center(
            child: Column(
          children: [
            Text('', style: TextStyle(fontSize: 30),),
            Text('Account Details',  style: TextStyle(color: Colors.white, fontSize: 30),),],
      )
          ),
          Row(
            children: [
              Text('', style: TextStyle(fontSize: 10),),
              Text('  Do you play with Home Brew? ', style: TextStyle(color: Colors.white, fontSize: 20),),
              Checkbox(
                value: _homeBrew,
                focusColor: Colors.white,
                activeColor: Colors.red[600],
                checkColor: Colors.white,
                onChanged: (bool val){
                  setState(() {
                    _homeBrew = val;
                  });
                },
              )
            ],
          ),
          Row(
            children: [
              Text('  Are you a DM? ', style: TextStyle(color: Colors.white, fontSize: 20),),
              Checkbox(
                focusColor: Colors.white,
                activeColor: Colors.red[600],
                checkColor: Colors.white,
                value: _dm,
                onChanged: (bool val){
                  setState(() {
                    _dm = !_dm;
                  });
                },
              )
            ],
          ),
          Row(
            children: [
              Text('  Favorite Class?     ', style: TextStyle(color: Colors.white, fontSize: 20),),
              DropdownButton<String>(
                value: _class,
                style: TextStyle(color: Colors.white, fontSize: 20,),
                dropdownColor: Colors.red[600],
                onChanged: (String newVal){
                  setState(() {
                    _class = newVal;
                  });
                },
                //copied from Flutter documentation at: https://api.flutter.dev/flutter/material/DropdownButton-class.html
                items: [
                  DropdownMenuItem(
                    value: 'None',
                    child: Text('None'),
                  ),
                  DropdownMenuItem(
                    value: 'Cleric',
                    child: Text('Cleric'),
                  ),
                  DropdownMenuItem(
                    value: 'Bard',
                    child: Text('Bard'),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
    tabs[3] = page.getPage(_context);
    return 'Flutter Demo';
  }


  Scaffold getPage(_context){
    Scaffold page;

    if(_signedIn){
      page = Scaffold(
        backgroundColor: _backColor,
        body: Center(
          child: Column(
            children: [
              Text('     ', style: TextStyle(fontSize: 15, color: _textColor),),
              Text('     ', style: TextStyle(fontSize: 15, color: _textColor),),
              Text('Currently: ' + (_signedIn ? 'Signed In' : 'Not Signed In'), style: TextStyle(fontSize: 15, color: _textColor),),
              Text('     ', style: TextStyle(fontSize: 15, color: _textColor),),
              Row(
                children: [
// Image is being difficult for no reason
/*Image(
              image: AssetImage('icons/google_logo.png'),
            ),*/
                  Text('                            ', style: TextStyle(fontSize: 15, color: _textColor),),

                  Center(
                      child: RaisedButton(
                        textColor: _textColor,
                        color: _frontColor,
                        onPressed: (){
                          _signedIn = false;
                          Scaffold page = getPage(_context);
                          setState(() {
                            tabs[3] = page;
                          });
                          return page;
                        },
                        child: Text('Sign out of Google', style: TextStyle(fontSize: 20, color: _textColor),),
                      )
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }else{
      page = Scaffold(
        backgroundColor: _backColor,
        body: Center(
          child: Column(
            children: [
              Text('     ', style: TextStyle(fontSize: 15, color: _textColor),),
              Text('     ', style: TextStyle(fontSize: 15, color: _textColor),),
              Text('Currently: ' + (_signedIn ? 'Signed In' : 'Not Signed In'), style: TextStyle(fontSize: 15, color: _textColor),),
              Text('     ', style: TextStyle(fontSize: 15, color: _textColor),),
              Row(
                children: [
// Image is being difficult for no reason
/*Image(
              image: AssetImage('icons/google_logo.png'),
            ),*/
                  Text('                            ', style: TextStyle(fontSize: 15, color: _textColor),),

                  Center(
                      child: RaisedButton(
                        textColor: _textColor,
                        color: _frontColor,
                        onPressed: (){
                          _signedIn = true;
                          signInWithGoogle().then((result) {
                          });
                          setState(() {
                            page = getPage(_context);
                            tabs[3] = page;
                            _slide = 2;
                          });
                          return page;
                        },
                        child: Text('Sign in with Google', style: TextStyle(fontSize: 20, color: _textColor),),
                      )
                  ),
                ],
              ),

            ],
          ),
        ),
      );
    }

    return page;
  }

   */

  @override
  Widget build(BuildContext context) {
    // same as Vari Class
    _backColor = Colors.white10;
    _frontColor = Colors.red[600];
    _textColor = Colors.white;

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
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new SettingsSc()));
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
            ]
          ),
        padding: EdgeInsets.fromLTRB(110, 100, 110, 15),
      ),
    );
  }
}