import 'package:flutter/material.dart';
import 'package:dnd_tinder/vari.dart';
import 'registerEmail.dart';
import 'sign_in.dart';
import 'package:dnd_tinder/settings.dart';
import 'login.dart';

class emailSignIn extends StatefulWidget {
  @override
  _emailSignInState createState() => _emailSignInState();
}

class _emailSignInState extends State<emailSignIn> {

  String _email = '';
  String _pw = '';

  String error = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                  Navigator.pop(context);
                }),
              ),
              Spacer(),
              Center(child: Text('     Sign In With Email', style: TextStyle(fontSize: 20, color: Vari.getTextColor()),)),
              Spacer(),
              IconButton(
                icon: Icon(Icons.compare_arrows),
                color: Vari.getTextColor(),
                onPressed: (() {
                  Navigator.pop(context);
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new registerEmail()));
                }),
              ),
            ],
          ),
        ),
        backgroundColor: Vari.getBackColor(),
        body: Container(
          padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20.0,),
                Text('Email Address', style: TextStyle(fontSize: 20, color: Vari.getTextColor())),
                TextFormField(
                  validator:((val){
                    if(val.isEmpty){
                      return 'Field is Empty';
                    }
                    return null;
                  }),
                  onChanged: ((String val){
                    setState(() {
                      _email = val;
                    });
                  }),
                ),
                SizedBox(height: 20.0,),
                Text('Password', style: TextStyle(fontSize: 20, color: Vari.getTextColor())),
                TextFormField(
                  validator: ((val){
                    return null;
                  }),
                  obscureText: true,
                  onChanged: ((String val){
                    setState(() {
                      _pw = val;
                    });
                  }),
                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                  color: Vari.getFrontColor(),
                  child: Text('Sign In', style: TextStyle(color: Vari.getTextColor(), fontSize: 20),),
                  onPressed: (() {
                    if(_formKey.currentState.validate()){
                      dynamic result = signInWithEmailAndPassword(_email, _pw);
                      if(result == null){
                        setState(() {
                          error = 'please supply valid email';
                        });
                      }else{
                        Vari.setSignedIn();
                        SettingsScState.updateData(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.push(context, new MaterialPageRoute(builder: (context) => new LoginSc()));
                      }
                    }
                  }),
                ),
                SizedBox(height: 12,),
                Text(error, style: TextStyle(fontSize: 14, color: Vari.getFrontColor()),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}