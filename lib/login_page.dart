import 'package:flutter/material.dart';
import 'sign_in.dart';

class LoginPage{
  Scaffold page;
  bool _signedIn;
  Color _backColor;
  Color _frontColor;
  Color _textColor;

  LoginPage(Color back, Color front, Color txt){
    _signedIn = false;
    _backColor = back;
    _frontColor = front;
    _textColor = txt;
  }

  Scaffold getPage(BuildContext _context){
    Scaffold page;

    if(_signedIn){
      page = Scaffold(
        backgroundColor: _backColor,
        body: Center(
          child: Column(
            children: [
              Text('     ', style: TextStyle(fontSize: 15),),
              Text('     ', style: TextStyle(fontSize: 15),),
              Text('Currently: ' + (_signedIn ? 'Signed In' : 'Not Signed In'), style: TextStyle(fontSize: 15),),
              Text('     ', style: TextStyle(fontSize: 15),),
              Row(
                children: [
// Image is being difficult for no reason
/*Image(
              image: AssetImage('icons/google_logo.png'),
            ),*/
                  Text('                            ', style: TextStyle(fontSize: 15),),

                  Center(
                      child: RaisedButton(
                        textColor: _textColor,
                        color: _frontColor,
                        onPressed: (){
                          _signedIn = false;
                          Scaffold page = getPage(_context);
                          return page;
                        },
                        child: Text('Sign out of Google', style: TextStyle(fontSize: 20),),
                      )
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }else{
      page = Scaffold(
        backgroundColor: _backColor,
        body: Center(
          child: Column(
            children: [
              Text('     ', style: TextStyle(fontSize: 15),),
              Text('     ', style: TextStyle(fontSize: 15),),
              Text('Currently: ' + (_signedIn ? 'Signed In' : 'Not Signed In'), style: TextStyle(fontSize: 15),),
              Text('     ', style: TextStyle(fontSize: 15),),
              Row(
                children: [
// Image is being difficult for no reason
/*Image(
              image: AssetImage('icons/google_logo.png'),
            ),*/
                  Text('                            ', style: TextStyle(fontSize: 15),),

                  Center(
                      child: RaisedButton(
                        textColor: _textColor,
                        color: _frontColor,
                        onPressed: (){
                          _signedIn = true;
                          signInWithGoogle().then((result) {
                            if (result != null) {
                              Navigator.of(_context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    page = getPage(_context);
                                    return page;
                                  },
                                ),
                              );
                            }
                          });
                        },
                        child: Text('Sign in with Google', style: TextStyle(fontSize: 20),),
                      )
                  ),
                ],
              ),

            ],
          ),
        ),
      );
    }

    return page;
  }

  bool getState(){
    return _signedIn;
  }

}