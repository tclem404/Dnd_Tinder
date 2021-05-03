// All from tutorial on: https://blog.codemagic.io/firebase-authentication-google-sign-in-using-flutter/
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'database.dart';
import '../vari.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async {

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    UserSaver.setUser(user);

    // database stuff
    Vari.setUid(user.uid);
    DatabaseService db = DatabaseService(uid: user.uid);
    Vari.setName(user.displayName);
    await db.createUserData(user.displayName);
    Vari.setDatabase(db);

    print('signInWithGoogle succeeded: $user');

    return '$user';
  }

  return null;
}
void signOutGoogle() async{
  await googleSignIn.signOut();
  Vari.setDatabase(null);

  print("User Signed Out");
}

class UserSaver{
  static User user;

  static void setUser(User _user){
    user = _user;
  }

  static User getUser(){
    return user;
  }
}

Future registerWithEmailAndPassword(String name, String email, String password) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    User user = result.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      UserSaver.setUser(user);

      // database stuff
      Vari.setUid(user.uid);
      DatabaseService db = DatabaseService(uid: user.uid);
      Vari.setName(name);
      await db.createUserData(name);
      Vari.setDatabase(db);

      print('registerWithEmailAndPassword succeeded: $user');

      return '$user';
    }

    return null;
}

Future signInWithEmailAndPassword(String email, String password) async {
  try{
    UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    User user = result.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      UserSaver.setUser(user);

      // database stuff
      Vari.setUid(user.uid);
      DatabaseService db = DatabaseService(uid: user.uid);



      Vari.setName(db.getUserName());
      await db.createUserData(db.getUserName());
      Vari.setDatabase(db);

      print('signedInWithEmailAndPassword succeeded: $user');

      return '$user';
    }
  }catch(e){
    print(e.toString());
    return null;
  }
}