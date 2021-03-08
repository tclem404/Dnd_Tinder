import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dnd_tinder/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'user.dart';
import 'vari.dart';

// all from code ninja's tutorials found in this playlist (specifically 16-18)\
// https://www.youtube.com/playlist?list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC
class DatabaseService{

  //collection refrence
  final CollectionReference users = FirebaseFirestore.instance.collection('Users');

  final String uid;

  DatabaseService({ this.uid });

  // for creation
  Future createUserData(String name) async{
    final possibleDoc = await users.doc(uid).get();
    if(!possibleDoc.exists){
      return await users.doc(uid).set({
        'dm':false,
        'homebrew': false,
        'name':Vari.getName(),
        'frontCol': 1,
        'backCol': 1,
        'textCol': 1,
        'edition': 'None',
        'favClass': 'None',
        'currentMatches': 0,
        'match1':'null',
        'match2':'null',
        'match3':'null',
        'match4':'null',
        'match5':'null',
      });
    }
    return null;
  }

  // for updating, pass in what changed, should have access to all varibles at all times
  // so adding all in one shouldnt be an issue
  Future updateUserData(bool _dm, bool _homebrew, String name, int _frontCol, int _backCol, int _textCol, String _favClass, String _edition) async {
    return await users.doc(uid).update({
      'dm':_dm,
      'homebrew': _homebrew,
      'name':name,
      'frontCol': _frontCol,
      'backCol': _backCol,
      'textCol': _textCol,
      'edition': _edition,
      'favClass': _favClass,
    });

    }

    Future updateMatches(String newUid, int matchesSet, String m1, String m2, String m3, String m4, String m5) async{
      return await users.doc(newUid).update({
        'currentMatches': matchesSet,
        'match1':m1,
        'match2':m2,
        'match3':m3,
        'match4':m4,
        'match5':m5,
      });

    }

    // User List from stream
  List<DnDUser> _userListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return DnDUser(
        uid: doc.id.toString(),
        name: doc.data()['name'].toString() ?? 'New User',
        dm: doc.data()['dm'] ?? false,
        homebrew: doc.data()['homebrew'] ?? false,
        frontCol: doc.data()['frontCol'] ?? 1,
        backCol: doc.data()['backCol'] ?? 1,
        textCol: doc.data()['textCol'] ?? 1,
        edition: doc.data()['edition'].toString() ?? 'None',
        favClass: doc.data()['favClass'].toString() ?? 'None',
        matchesSet: doc.data()['currentMatches'] ?? 0,
        match1: doc.data()['match1'].toString() ?? 'null',
        match2: doc.data()['match2'].toString() ?? 'null',
        match3: doc.data()['match3'].toString() ?? 'null',
        match4: doc.data()['match4'].toString() ?? 'null',
        match5: doc.data()['match5'].toString() ?? 'null',
      );
    }).toList();
  }


    // getting a stream (?)
    Stream<List<DnDUser>> get userInfo{
      return users.snapshots().map(_userListFromSnapshot);
    }

}