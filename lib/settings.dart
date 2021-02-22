import 'package:dnd_tinder/database.dart';
import 'package:flutter/material.dart';
import 'vari.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'userList.dart';
import 'user.dart';
import 'main2.dart';

class SettingsSc extends StatefulWidget {
  @override
  _SettingsScState createState() => _SettingsScState();
}

class _SettingsScState extends State<SettingsSc> {
  static bool _homeBrew = Vari.getHomebrew();
  static bool _dm = Vari.getDm();
  static var _class = Vari.getFavClass();
  static var _edition = Vari.getFavEdition();

  static int _index = -1;

  static bool _once = false;

  @override
  Widget build(BuildContext _context) {
    final users = Provider.of<List<DnDUser>>(_context);

    if(!_once) {
      for (int i = 0; i < users.length; i++) {
        if (Vari.getUid() == users[i].uid) {
          _index = i;
        }
      }

      _homeBrew = users[_index].homebrew;
      _dm = users[_index].dm;
      _class = users[_index].favClass;
      _edition = users[_index].edition;

      _once = !_once;
    }

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
                Center(child: Text('     Settings', style: TextStyle(fontSize: 20, color: Vari.getTextColor()),)),
              ],
            ),
          ),
          backgroundColor: Colors.white10,
          body: Container(
            child: Column(
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
                ),
                Row( //This is where the player chooses which version of DnD they enjoy most
                  children: [
                    Text('  Favorite Edition?  ', style: TextStyle(color: Colors.white, fontSize: 20),),
                    DropdownButton<String>(
                      value: _edition,
                      style: TextStyle(color: Colors.white, fontSize: 20,),
                      dropdownColor: Colors.red[600],
                      onChanged: (String newVal){
                        setState(() {
                          _edition = newVal;
                        });
                      },

                      items: [
                        DropdownMenuItem(
                          value: 'None',
                          child: Text('None'),
                        ),
                        DropdownMenuItem(
                          value: 'DnD 1974',
                          child: Text('DnD 1974'),
                        ),
                        DropdownMenuItem(
                          value: 'Adv. DnD',
                          child: Text('Adv. DnD'),
                        ),
                        DropdownMenuItem(
                          value: 'Adv. DnD 2e',
                          child: Text('Adv. DnD 2e'),
                        ),
                        DropdownMenuItem(
                          value: 'DnD 3e',
                          child: Text('DnD 3e'),
                        ),
                        DropdownMenuItem(
                          value: 'DnD 3.5e',
                          child: Text('DnD 3.5e'),
                        ),
                        DropdownMenuItem(
                          value: 'DnD 4e',
                          child: Text('DnD 4e'),
                        ),
                        DropdownMenuItem(
                          value: 'DnD 5e',
                          child: Text('DnD 5e'),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            padding: EdgeInsets.fromLTRB(30, 15, 15, 15),
          ),
          floatingActionButton: FloatingActionButton.extended(
            icon: Icon(Icons.save_alt),
            label: Text('Save'),
            backgroundColor: Vari.getFrontColor(),
            onPressed: (){
              if(Vari.getSignedIn()){
                Vari.getDatabase().updateUserData(_dm, _homeBrew, Vari.getName(), 1, 1, 1, _class, _edition);
              }else{
                showDialog(
                  context: context,
                  builder: (BuildContext context) => buildPopupDialog(context, 'You must be signed in to save prefrences'),
                 );
              }
            },
          ),
        ),
      );
  }
}

// stolen from https://dev.to/fluttercorner/how-to-create-popup-in-flutter-popup-menu-example-fluttercorner-com-373e
Widget buildPopupDialog(BuildContext context, String txt) {
  return new AlertDialog(
    title: const Text('Error'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(txt),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}
