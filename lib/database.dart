import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dnd_tinder/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'user.dart';

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
      return this.updateUserData(false, false, name, 1, 1, 1, 'none', 'none');
    }
    return null;
  }

  // for updating, pass in what changed, should have access to all varibles at all times
  // so adding all in one shouldnt be an issue
  Future updateUserData(bool _dm, bool _homebrew, String name, int _frontCol, int _backCol, int _textCol, String _favClass, String _edition) async {
    return await users.doc(uid).set({
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
      );
    }).toList();
  }


    // getting a stream (?)
    Stream<List<DnDUser>> get userInfo{
      return users.snapshots().map(_userListFromSnapshot);
    }

}