import 'package:flutter/material.dart';
import 'vari.dart';

class MatchesSc extends StatefulWidget {
  @override
  _MatchesScState createState() => _MatchesScState();
}

class _MatchesScState extends State<MatchesSc> {

  @override
  Widget build(BuildContext _context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Vari.getFrontColor(),
          title: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                color: Vari.getTextColor(),
                onPressed: (() {
                  Navigator.pop(_context);
                }),
              ),
              Center(child: Text('     Matches', style: TextStyle(fontSize: 20, color: Vari.getTextColor()),)),
            ],
          ),
        ),
          backgroundColor: Colors.white10,
          body: Center(child: Text('Matches', style: TextStyle(color: Colors.white, fontSize: 30),))
      ),
    );
  }
}
