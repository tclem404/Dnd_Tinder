import 'package:dnd_tinder/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'vari.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'userList.dart';
import 'main.dart';

class ColorScreen extends StatefulWidget {
  @override
  _ColorScreenState createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  int _txt = 1;

  @override
  Widget build(BuildContext _context) {
    // ignore: missing_return
    Color getColor() {
      if (_txt == 1) {
        return Colors.red;
      } else if (_txt == 2) {
        return Colors.blue;
      }
    }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: (getColor()),
            title: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Vari.getTextColor(),
                  onPressed: (() {
                    Navigator.pop(_context);
                  }),
                ),
                Center(child: Text('     Color Customizer', style: TextStyle(fontSize: 20, color: Vari.getTextColor()),)),
              ],
            ),
          ),
          backgroundColor: Colors.white10,
          body: Container(
            padding: EdgeInsets.fromLTRB(30, 15, 15, 15),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('  TextColor     ', style: TextStyle(fontSize: 20, color: Vari.getTextColor()),),
                    DropdownButton<int>(
                      value: _txt,
                      style: TextStyle(color: Colors.white, fontSize: 20,),
                      dropdownColor: Colors.red[600],
                      onChanged: (int newVal){
                        setState(() {
                          _txt = newVal;
                        });
                      },
                      //copied from Flutter documentation at: https://api.flutter.dev/flutter/material/DropdownButton-class.html
                      items: [
                        DropdownMenuItem(
                          value: 1,
                          child: Text('Red', style: TextStyle(color: Colors.red)),
                          onTap: (){

                          }
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text('Blue', style: TextStyle(color: Colors.blue)),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text('Grey', style: TextStyle(color: Colors.white24)),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}
