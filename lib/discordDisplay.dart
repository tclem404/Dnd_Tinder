
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'vari.dart';
import 'Database/user.dart';

class DiscordDisplay{

  DnDUser _user;
  BuildContext _context;

  DiscordDisplay(DnDUser u, BuildContext context){
    this._user = u;
    this._context = context;
  }

  Widget display(Function f){
    return Row(
      children: [
        Text(_user.name + ': ' + _user.discord, style: TextStyle(color: Vari.getTextColor(), fontSize: 20),),
        Spacer(),
        RaisedButton(
          child: Icon(Icons.arrow_forward),
          color: Vari.getFrontColor(),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
         onPressed: ( () {f(_context, _user);}),
        )
      ],
    );
  }

}