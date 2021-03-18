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

    if(skipped.length - 1 == users.length && users.elementAt(_selfIndex).possibleMatches.length == 0){
      return -1;
    }

    if(users.elementAt(_selfIndex).possibleMatches.length == 0) {
      matched = false;
      while (users
          .elementAt(_i)
          .uid == Vari.getUid() || skipped.contains(_i)) {
        _i = rng.nextInt(users.length);
      }
    }else{
      matched = true;
      var uidToFind = users.elementAt(_selfIndex).possibleMatches.elementAt(users.elementAt(_selfIndex).possibleMatches.length - 1);

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

    if(users.elementAt(_selfIndex).possibleMatches.length == 0) {
      matched = false;
      while (users
          .elementAt(_i)
          .uid == Vari.getUid() || skipped.contains(_i)) {
        _i = rng.nextInt(users.length);
      }
    }else{
      matched = true;
      DnDUser curUser = users.elementAt(_selfIndex);
      var uidToFind = curUser.possibleMatches.elementAt(curUser.possibleMatches.length - 1);

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
                              curUser.possibleMatches.removeLast();

                              Vari.getDatabase().updateMatches(curUser.uid, curUser.matchArr, curUser.possibleMatches);

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
                            if(!matched){
                              DnDUser u = users.elementAt(_i);
                              u.possibleMatches.add(Vari.getUid());
                              Vari.getDatabase().updateMatches(u.uid, u.matchArr, u.possibleMatches);
                              _i = getNewMatch(users, rng);
                            }else{
                              DnDUser curUser = users.elementAt(_selfIndex);
                              DnDUser u = users.elementAt(_i);
                              curUser.matchArr.add(u.uid);
                              u.matchArr.add(curUser.uid);
                              Vari.getDatabase().updateMatches(u.uid, u.matchArr, u.possibleMatches);
                              Vari.getDatabase().updateMatches(curUser.uid, curUser.matchArr, curUser.possibleMatches);
                              _i = getNewMatch(users, rng);
                            }
                          });
                        }),
                      ),

                  ],
                ),
              ],
            ),
          ),
      ),
    );
  }
}
