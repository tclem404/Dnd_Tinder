import 'package:flutter/material.dart';
import 'login_page.dart';
import 'main_screen.dart';
import 'sign_in.dart';
import 'first_screen.dart';

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
  LoginPage page = new LoginPage(Colors.white10, Colors.red[600], Colors.white);
  MainScreen mainSc = new MainScreen(Colors.white10, Colors.red[600], Colors.white);

  var tabs = [
    Scaffold(),Scaffold(),Scaffold(),Scaffold()
  ];

  // just some random comments to tests commits with github
  //ignore these
  String onRun(BuildContext _context){
    tabs[0] = mainSc.getPage();
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

  @override
  Widget build(BuildContext context) {
    _backColor = Colors.white10;
    _frontColor = Colors.red[600];
    _textColor = Colors.white;

    return MaterialApp(
      // The Slides
      title: onRun(context), // Really janky solution, but it works
      home: Scaffold(
        body: tabs[_slide],
        backgroundColor: _backColor,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _slide,
          onTap: (index){
            setState(() {
              tabs[0] = mainSc.getPage();
              tabs[3] = page.getPage(context);
              _slide = index;
            });
          },
          backgroundColor: _frontColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white24,
          items: [
            BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home),
              backgroundColor: Colors.red[600],
            ),
            BottomNavigationBarItem(
              title: Text('Matches'),
              icon: Icon(Icons.search),
              backgroundColor: Colors.red[600],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              backgroundColor: Colors.red[600],
                title: Text("Account")
            ),
            BottomNavigationBarItem(
                backgroundColor: Colors.red[600],
                icon: Icon(Icons.settings),
                title: Text("Settings")
            ),
          ],
        ),
      ),
    );
  }
}