import 'package:flutter/material.dart';
import 'sign_in.dart';
import '../vari.dart';

class LoginSc extends StatefulWidget {
  @override
  _LoginStState createState() => _LoginStState();
}

class _LoginStState extends State<LoginSc> {
  @override
  Widget build(BuildContext _context) {
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
              Center(child: Text('     Account', style: TextStyle(fontSize: 20, color: Vari.getTextColor()),)),
            ],
          ),
        ),


        backgroundColor: Vari.getBackColor(),
        body: Center(
        child: Column(
          children: [
            Text('     ', style: TextStyle(fontSize: 15, color: Vari.getTextColor()),),
            Text('     ', style: TextStyle(fontSize: 15, color: Vari.getTextColor()),),
            Text('Currently: ' + (Vari.getSignedIn() ? 'Signed In' : 'Not Signed In'), style: TextStyle(fontSize: 30, color: Vari.getTextColor()),),
            Text('     ', style: TextStyle(fontSize: 15, color: Vari.getTextColor()),),
            Row(
              children: [

                // Image is being difficult for no reason
                /*Image(
              image: AssetImage('icons/google_logo.png'),
            ),*/
                Text('                            ', style: TextStyle(fontSize: 15, color: Vari.getTextColor()),),

                Center(
                    child: RaisedButton(
                      textColor: Vari.getTextColor(),
                      color: Vari.getFrontColor(),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                      onPressed: (){
                        if(Vari.getSignedIn()){
                          signOutGoogle();
                          setState(() {
                            Vari.setSignedIn();
                          });
                        }else{
                          signInWithGoogle().then((result) {
                            if (result != null) {
                              setState(() {
                                Vari.setSignedIn();
                              });
                            }
                          });
                        }
                      },
                      child: Text((Vari.getSignedIn() ? 'Sign Out of Google' : 'Sign In with Google'), style: TextStyle(fontSize: 20, color: Vari.getTextColor()),),
                    )
                ),
              ],
            )
          ],
        ),
      ),
      )
    );
  }
}
