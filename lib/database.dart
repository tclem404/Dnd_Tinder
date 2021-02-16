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
  Future createUserData() async{
    final possibleDoc = await users.doc(uid).get();
    if(!possibleDoc.exists){
      return this.updateUserData(false, 'New User', 1, 1, 1, 'none', 'none');
    }
    return null;
  }

  // for updating, pass in what changed, should have access to all varibles at all times
  // so adding all in one shouldnt be an issue
  Future updateUserData(bool _dm, String name, int _frontCol, int _backCol, int _textCol, String _favClass, String _edition) async {
    await users.doc(uid).set({
      'dm':_dm,
      'name':name,
    });
    await users.doc(uid).collection('Prefrences').doc('Cosmetic').set({
      'frontCol': _frontCol,
      'backCol': _backCol,
      'textCol': _textCol,
    });
    return await users.doc(uid).collection('Prefrences').doc('Gameplay').set({
      'edition': _edition,
      'favClass': _favClass,
    });

    }

    // User List from stream
  List<User> _userListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return User(
        uid: doc.id,
        name: doc.data()['name'],
        dm: doc.data()['dm'],

      );
    });
  }

    // getting a stream (?)
    Stream<QuerySnapshot> get userInfo{
      return users.snapshots();
    }

}