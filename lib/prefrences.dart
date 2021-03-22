import 'package:flutter/material.dart';
import 'vari.dart';

class SortingScreen extends StatefulWidget {
  @override
  _SortingScreenState createState() => _SortingScreenState();
}

class _SortingScreenState extends State<SortingScreen> {





  @override
  Widget build(BuildContext context) {
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
                  Navigator.pop(context);
                }),
              ),
              Center(child: Text('     Settings', style: TextStyle(fontSize: 20, color: Vari.getTextColor()),)),
            ],
          ),
        ),
      ),
    );
  }
}
