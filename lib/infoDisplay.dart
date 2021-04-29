import 'package:flutter/material.dart';
import 'Database/user.dart';
import 'vari.dart';

class InfoDisplay extends StatefulWidget {
  @override
  _InfoDisplayState createState() => _InfoDisplayState();
}

class _InfoDisplayState extends State<InfoDisplay> {
  @override
  Widget build(BuildContext context) {

    DnDUser u = Vari.getDndUser();

    return Scaffold(
      backgroundColor: Vari.getBackColor(),
      appBar: AppBar(
        backgroundColor: Vari.getFrontColor(),
        title: Row(
          children: [
            /*IconButton(
              icon: Icon(Icons.arrow_back),
              color: Vari.getTextColor(),
              onPressed: (() {
                Navigator.pop(context);
              }),
            ),*/
            Text('Info: ' + u.name, style: TextStyle(fontSize: 20, color: Vari.getTextColor()),),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: Column(
          children: [
            Row(children: [Text('Name: ' + u.name, style: TextStyle(fontSize: 20, color: Vari.getTextColor())), Spacer()]),
            Spacer(),
            Row(children: [Text('Role: ' + (u.dm ? 'DM' : 'PC'), style: TextStyle(fontSize: 20, color: Vari.getTextColor())), Spacer()]),
            Spacer(),
            Row(children: [Text('Favorite Edition: ' + u.edition, style: TextStyle(fontSize: 20, color: Vari.getTextColor())), Spacer()]),
            Spacer(),
            Row(children: [Text('Homebrew Prefrences: ' + (u.homebrew ? 'Homebrew Welcome' : 'No Homebrew'), style: TextStyle(fontSize: 20, color: Vari.getTextColor())), Spacer()]),
            Spacer(),
            Row(children: [Text('Favorite Class: ' + u.favClass, style: TextStyle(fontSize: 20, color: Vari.getTextColor())), Spacer()]),
          ],
        ),
      ),
    );
  }
}
