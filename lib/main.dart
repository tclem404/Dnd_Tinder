import 'package:flutter/material.dart';

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
  static bool _homeBrew = false;
  static bool _dm = false;

  var tabs = [
    Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: Center(
          child: Text('Welcome to [Name not yet decided]'),
        ),
        backgroundColor: Colors.red[600],
      ),
      body: Center(
        child: Image(
          image: AssetImage('icons/d20(1).png'),
          height: 300,
          width: 300,
        ),
      ),
    ),
    Center(child: Text('Matches')),
    Scaffold(
      backgroundColor: Colors.white10,
      body: Column(
        children: [
          Center(
            child: Text('Account Details'),
          ),
          Row(
            children: [
              Text('Do you play with Home Brew?'),
              Checkbox(
                value: MyAppHome._homeBrew,
                onChanged: (bool val){
                  MyAppHome._homeBrew = !MyAppHome._homeBrew;
                },
              )
            ],
          ),
          Row(
            children: [
              Text('Are you a DM?'),
              Checkbox(
                value: _dm,
                onChanged: (bool val){
                  MyAppHome._dm = !MyAppHome._dm;
                },
              )
            ],
          )
        ],
      ),
    ),
    Center(child: Text('Settings')),
  ];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: tabs[_slide],
        backgroundColor: Colors.white10,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _slide,
          onTap: (index){
            setState(() {
              _slide = index;
            });
          },
          backgroundColor: Colors.red[600],
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

