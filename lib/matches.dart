import 'package:dnd_tinder/prefrences.dart';
import 'package:flutter/material.dart';
import 'vari.dart';
import 'Database/user.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'prefrences.dart';
import 'package:flutter/gestures.dart';
import 'package:confetti/confetti.dart';

class MatchesSc extends StatefulWidget {
  @override
  _MatchesScState createState() => _MatchesScState();
}

class _MatchesScState extends State<MatchesSc> {

  static List<int> skipped = new List<int>();
  static int _i = 0;
  static int _selfIndex = 0;
  static bool matched = false;
  static ConfettiController confettiController = ConfettiController(duration: Duration(seconds: 1));

  int getNewMatch(List<DnDUser> users, Random rng){
    if(_i != -1) {
      skipped.add(_i);
    }

    int loops = 0;

    if(skipped.length - 1 == users.length && users.elementAt(_selfIndex).possibleMatches.length == 0){
      _i = -1;
      return -1;
    }

    if(users.elementAt(_selfIndex).possibleMatches.length == 0) {
      matched = false;
      while (((_i == -1 || users.elementAt(_i).uid == Vari.getUid()) || skipped.contains(_i)) ||
          (SortingScreenState.include[0] && SortingScreenState.dm != users[_i].dm) ||
          (SortingScreenState.include[1] && SortingScreenState.homebrew != users[_i].homebrew) ||
          (SortingScreenState.include[3] && SortingScreenState.favClass != users[_i].favClass) ||
          (SortingScreenState.include[2] && SortingScreenState.edition != users[_i].edition)) {
        _i = rng.nextInt(users.length);
        loops++;
        if(loops > 3 * users.length){
          _i = -1;
          return _i;
        }
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

    getNewMatch(users, rng);


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
              Spacer(),
              Center(child: Text('     Matches', style: TextStyle(fontSize: 20, color: Vari.getTextColor()),)),
              Spacer(),
              IconButton(
                icon: Icon(Icons.settings),
                color: Vari.getTextColor(),
                onPressed: (() {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new SortingScreen()));
                }),
              ),
            ],
          ),
        ),
          backgroundColor: Colors.white10,
          body: getBody(users, rng),
      ),
    );
  }
  
  
  Widget getBody(List<DnDUser> users, Random rng){
    if(_i >= 0){
      return Container(
        padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
        child: Column(
          children: [
            ConfettiWidget(
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              confettiController: confettiController,
              numberOfParticles: 20,
              gravity: 0.2,
              emissionFrequency: .25,
            ),
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
                    if(matched) {
                      curUser.possibleMatches.removeLast();

                      Vari.getDatabase().updateMatches(
                          curUser.uid, curUser.matchArr,
                          curUser.possibleMatches);
                    }
                    setState(() {
                      _i = getNewMatch(users, rng);
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
                    confettiController.play();

                      if(!matched){
                        DnDUser u = users.elementAt(_i);
                        u.possibleMatches.add(Vari.getUid());
                        Vari.getDatabase().updateMatches(u.uid, u.matchArr, u.possibleMatches);
                      }else{
                        DnDUser curUser = users.elementAt(_selfIndex);
                        DnDUser u = users.elementAt(_i);
                        curUser.matchArr.add(u.uid);
                        u.matchArr.add(curUser.uid);
                        Vari.getDatabase().updateMatches(u.uid, u.matchArr, u.possibleMatches);
                        Vari.getDatabase().updateMatches(curUser.uid, curUser.matchArr, curUser.possibleMatches);
                      }
                    setState(() {
                      _i = getNewMatch(users, rng);
                    });
                  }),
                ),
              ],
            ),
          ],
        ),
      );
    }else{
      return Container(
        padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
        child: Column(
          children: [
            Center(child: Text('Sorry, There seems to be', style: TextStyle(fontSize: 25, color: Vari.getTextColor()))),
            Center(child: Text('No Matches', style: TextStyle(fontSize: 25, color: Vari.getTextColor()))),
            SizedBox(height: 20,),
            Center(child: Text('Try again another time', style: TextStyle(fontSize: 15, color: Vari.getTextColor()))),
            SizedBox(height: 20,),
            RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60),),
              child: Text('Try Again', style: TextStyle(fontSize: 20, color: Vari.getTextColor()),),
              color: Vari.getFrontColor(),
              onPressed: ((){
                confettiController.play();
                setState(() {
                  print('Tried');
                  _i = getNewMatch(users, rng);
                });
              }),
            ),
          ],
        ),
      );
    }
  }
}
