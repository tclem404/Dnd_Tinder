import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class UserList{

  var userList;
  var uid;

  UserList(BuildContext con, String){
    userList = Provider.of<QuerySnapshot>(con);
  }


}
