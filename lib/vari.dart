import 'package:dnd_tinder/database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// solution to getting global variables, janky but it works fine
class Vari{
  static String _name = 'New User';

  static Color _backColor = Colors.white10;
  static Color _frontColor = Colors.red[600];
  static Color _textColor = Colors.white;
  static bool _signedIn = false;
  static DatabaseService _db;

  static String _uid;

  static bool _homeBrew = false;
  static bool _dm = false;
  static String _favClass = 'None';
  static String _edition= 'None';

  static void signIn(){
    if(_db != null){

    }
  }

  static void setBackColor(Color col){
    _backColor = col;
  }

  static Color getBackColor(){
    return _backColor;
  }

  static Color getFrontColor(){
    return _frontColor;
  }

  static void setFrontColor(Color col){
    _frontColor = col;
  }

  static Color getTextColor(){
    return _textColor;
  }

  static void setTextColor(Color col){
    _textColor = col;
  }

  static bool getSignedIn(){
    return _signedIn;
  }

  static void setSignedIn(){
    _signedIn = !_signedIn;
  }

  static void setDatabase(DatabaseService db){
    _db = db;
  }

  static DatabaseService getDatabase(){
    if(_signedIn) {
      return _db;
    }
    return null;
  }

  static void setHomebrew(bool hb){
    _homeBrew = hb;
  }

  static bool getHomebrew(){
    return _homeBrew;
  }

  static void setDm(bool dm){
    _dm = dm;
  }

  static bool getDm(){
    return _dm;
  }

  static void setFavClass(String fav){
    _favClass = fav;
  }

  static String getFavClass(){
    return _favClass;
  }

  static void setFavEdition(String ed){
    _edition = ed;
  }

  static String getFavEdition(){
    return _edition;
  }

  static void setUid(String uid){
    _uid = uid;
  }

  static String getUid(){
    return _uid;
  }

  static void setName(String uid){
    _name = uid;
  }

  static String getName(){
    return _name;
  }
}