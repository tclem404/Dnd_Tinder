import 'package:flutter/material.dart';
import 'vari.dart';
import 'user.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';

class MatchesSc extends StatefulWidget {
  @override
  _MatchesScState createState() => _MatchesScState();
}

class _MatchesScState extends State<MatchesSc> {

  static List<int> skipped = new List<int>();
  static int _i = 0;
  static int _selfIndex = 0;
  static bool matched = false;

  int getNewMatch(List<DnDUser> users, Random rng){
    skipped.add(_i);

    if(skipped.length - 1 == users.length && users.elementAt(_selfIndex).matchesSet == 0){
      return -1;
    }

    if(users.elementAt(_selfIndex).matchesSet == 0) {
      matched = false;
      while (users
          .elementAt(_i)
          .uid == Vari.getUid() || skipped.contains(_i)) {
        _i = rng.nextInt(users.length);
      }
    }else{
      matched = true;
      DnDUser curUser = users.elementAt(_selfIndex);
      var uidToFind = 'null';
      if(curUser.matchesSet == 1){uidToFind = curUser.match1;}else if(curUser.matchesSet == 2){uidToFind = curUser.match2;}else if(curUser.matchesSet == 3){uidToFind = curUser.match3;}else if(curUser.matchesSet == 4){uidToFind = curUser.match4;}

      _i = 0;
      while(users.elementAt(_i).uid != uidToFind){
        _i++;
      }
    }

    return _i;
  }

  void getSelfIndex(List<DnDUser> users){
    while(users.elementAt(_selfIndex).uid != Vari.getUid()){
      _selfIndex++;
    }
  }
  

  @override
  Widget build(BuildContext _context) {
    final users = Provider.of<List<DnDUser>>(_context);
    Random rng = new Random();
    getSelfIndex(users);

    if(users.elementAt(_selfIndex).matchesSet == 0) {
      matched = false;
      while (users
          .elementAt(_i)
          .uid == Vari.getUid() || skipped.contains(_i)) {
        _i = rng.nextInt(users.length);
      }
    }else{
      matched = true;
      DnDUser curUser = users.elementAt(_selfIndex);
      var uidToFind = 'null';
      if(curUser.matchesSet == 1){uidToFind = curUser.match1;}else if(curUser.matchesSet == 2){uidToFind = curUser.match2;}else if(curUser.matchesSet == 3){uidToFind = curUser.match3;}else if(curUser.matchesSet == 4){uidToFind = curUser.match4;}

      _i = 0;
      while(users.elementAt(_i).uid != uidToFind){
        _i++;
      }
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
              Center(child: Text('     Matches', style: TextStyle(fontSize: 20, color: Vari.getTextColor()),)),
            ],
          ),
        ),
          backgroundColor: Colors.white10,
          body: Container(
            padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            child: Column(
              children: [
                Text("Name: " + users.elementAt(_i).name, style: TextStyle(fontSize: 20, color: Vari.getTextColor())),
                Text("Type: " + (users.elementAt(_i).dm ? 'DM' : 'PC'), style: TextStyle(fontSize: 20, color: Vari.getTextColor())),
                Row(
                  children: [
                    // deny
                    RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60),),
                        child: Icon(Icons.close, color: Vari.getTextColor()),
                        color: Vari.getFrontColor(),
                        onPressed: ((){
                          DnDUser curUser = users.elementAt(_selfIndex);
                          setState(() {
                            if(matched) {
                              if(curUser.matchesSet == 1){users.elementAt(_selfIndex).match1 = 'null';}else if(curUser.matchesSet == 2){users.elementAt(_selfIndex).match2 = 'null';}else if(curUser.matchesSet == 3){users.elementAt(_selfIndex).match3 = 'null';}else if(curUser.matchesSet == 4){users.elementAt(_selfIndex).match4 = 'null';}

                              users.elementAt(_selfIndex).matchesSet--;

                              Vari.getDatabase().updateMatches(curUser.uid, curUser.matchesSet, curUser.match1, curUser.match2, curUser.match3, curUser.match4, curUser.match5);

                              _i = getNewMatch(users, rng);
                            }else{
                              _i = getNewMatch(users, rng);
                            }
                          });
                        }),
                      ),

                    Spacer(flex: 5,),

                    // match
                    RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60),),
                        child: Icon(Icons.check, color: Vari.getTextColor()),
                        color: Vari.getFrontColor(),
                        onPressed: ((){
                          setState(() {
                            DnDUser u = users.elementAt(_i);
                            Vari.getDatabase().updateMatches(u.uid, u.matchesSet + 1, (u.matchesSet == 0 ? Vari.getUid() : u.match1), (u.matchesSet == 1 ? Vari.getUid() : u.match2), (u.matchesSet == 2 ? Vari.getUid() : u.match3), (u.matchesSet == 3 ? Vari.getUid() : u.match4), (u.matchesSet == 4 ? Vari.getUid() : u.match5));
                            _i = getNewMatch(users, rng);
                          });
                        }),
                      ),

                  ],
                ),
              ],
            ),
          ),
        /*floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.save_alt),
          label: Text('Save'),
          backgroundColor: Vari.getFrontColor(),
          onPressed: (){
            DnDUser curUser = users.elementAt(_selfIndex);
            Vari.getDatabase().updateMatches(curUser.uid, curUser.matchesSet, curUser.match1, curUser.match2, curUser.match3, curUser.match4, curUser.match5);
          },
        ),*/
      ),
    );
  }
}
