import 'package:dnd_tinder/vari.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dnd_tinder/theme.dart';

class ThemeSc extends StatefulWidget {
  @override
  _ThemeScState createState() => _ThemeScState();
}

class _ThemeScState extends State<ThemeSc> {
  @override
  Widget build(BuildContext _context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

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
                Center(child: Text('     Themes', style: TextStyle(fontSize: 20, color: Vari.getTextColor()),)),
              ],
            ),
          ),
        body: Container(
          child: Column(
            children: <Widget>[
              FlatButton(
                child: Text('Dark Theme'),
                onPressed: () => _themeChanger.setTheme(ThemeData.dark())),
              FlatButton(
                child: Text('Light Theme'),
                onPressed: () => _themeChanger.setTheme(ThemeData.light())),
            ]
          )
        )
      ),
    );
  }
}