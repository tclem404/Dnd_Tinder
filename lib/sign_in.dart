// All from tutorial on: https://blog.codemagic.io/firebase-authentication-google-sign-in-using-flutter/
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();

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

    print('signInWithGoogle succeeded: $user');

    return '$user';
  }

  return null;
}
void signOutGoogle() async{
  await googleSignIn.signOut();

  print("User Signed Out");
}

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Center(
          child: Row(
            children: [
              Text('                            ', style: TextStyle(fontSize: 15),),

              Center(
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.red[600],
                    onPressed: (){
                      signInWithGoogle().then((result) {
                        signOutGoogle();
                      });
                    },
                    child: Text('Sign Out', style: TextStyle(fontSize: 20),),
                  )
              )
            ],
          )
      ),
    );
  }
}