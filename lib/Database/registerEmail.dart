import 'package:dnd_tinder/Database/login.dart';
import 'package:flutter/material.dart';
import 'package:dnd_tinder/vari.dart';
import 'sign_in_email.dart';
import 'sign_in.dart';
import 'package:dnd_tinder/settings.dart';

class registerEmail extends StatefulWidget {
  @override
  _registerEmailState createState() => _registerEmailState();
}

class _registerEmailState extends State<registerEmail> {

  String _email = '';
  String _pw = '';
  String _name = '';

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
              Center(child: Text('     Register Email', style: TextStyle(fontSize: 20, color: Vari.getTextColor()),)),
              Spacer(),
              IconButton(
                icon: Icon(Icons.compare_arrows),
                color: Vari.getTextColor(),
                onPressed: (() {
                  Navigator.pop(context);
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new emailSignIn()));
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
                Text('Name', style: TextStyle(fontSize: 20, color: Vari.getTextColor())),
                TextFormField(
                  validator:((val){
                    if(val.isEmpty){
                      return 'Field is Empty';
                    }
                    return null;
                  }),
                  onChanged: ((String val){
                    setState(() {
                      _name = val;
                    });
                  }),
                ),
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
                  validator:((val){
                    if(val.length < 6){
                      return 'Password must be 6+ characters long';
                    }

                    bool containsNum = false;
                    for(int i = 0; i < 10; i++){
                      if(val.contains('$i')){
                        containsNum = true;
                      }
                    }
                    if(!containsNum){
                      return 'Password must contain 1 number';
                    }

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
                  child: Text('Register', style: TextStyle(color: Vari.getTextColor(), fontSize: 20),),
                  onPressed: (() {
                    if(_formKey.currentState.validate()){
                      dynamic result = registerWithEmailAndPassword(_name, _email, _pw);
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
