import 'package:dnd_tinder/Database/sign_in_email.dart';
import 'package:flutter/material.dart';
import 'sign_in.dart';
import '../vari.dart';
import 'registerEmail.dart';
import 'package:dnd_tinder/settings.dart';

class LoginSc extends StatefulWidget {
  @override
  LoginStState createState() => LoginStState();
}

class LoginStState extends State<LoginSc> {
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
        body: getBody(),
      )
    );
  }

  Widget getBody(){
    if(Vari.getSignedIn()){
      return Container(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 15),
        child: Center(
          child: Column(
            children: [
              Text('Welcome ' + Vari.getName(), style: TextStyle(fontSize: 30, color: Vari.getTextColor()),),
              Spacer(),
              RaisedButton(
                textColor: Vari.getTextColor(),
                color: Vari.getFrontColor(),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                onPressed: (){
                  signOutGoogle();
                  setState(() {
                    Vari.setSignedIn();
                  });
                },
                child: Text('Log Out', style: TextStyle(fontSize: 20, color: Vari.getTextColor()),),
              ),
              Spacer(flex: 9,)
            ],
          ),
        ),
      );
    }else{
      return Container(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 15),
        child: Center(
          child: Column(
            children: [
              Text('Not Signed In', style: TextStyle(fontSize: 30, color: Vari.getTextColor()),),
              Spacer(),
              RaisedButton(
                textColor: Vari.getTextColor(),
                color: Vari.getFrontColor(),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                onPressed: (){
                  signInWithGoogle().then((result) {
                    if (result != null) {
                      setState(() {
                        Vari.setSignedIn();
                        SettingsScState.updateData(context);
                      });
                    }
                  });
                },
                child: Text('Sign In with Google', style: TextStyle(fontSize: 20, color: Vari.getTextColor()),),
              ),
              SizedBox(height: 30.0,),
              RaisedButton(
                textColor: Vari.getTextColor(),
                color: Vari.getFrontColor(),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                onPressed: (){
                  if(Vari.getSignedIn()){
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new emailSignIn()));
                  }else{
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new emailSignIn()));
                  }
                },
                child: Text('Sign In/Register with Email', style: TextStyle(fontSize: 20, color: Vari.getTextColor()),),
              ),
              Spacer(flex: 4,)
            ],
          ),
        ),
      );
    }
  }
}
