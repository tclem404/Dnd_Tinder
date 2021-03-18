import 'package:flutter/material.dart';
import 'vari.dart';
import 'package:provider/provider.dart';
import 'user.dart';

class MessageSc extends StatefulWidget {
  @override
  _MessageScState createState() => _MessageScState();
}

class _MessageScState extends State<MessageSc> {

  static int _index = 0;
  static int  pages = 0;
  static int curPage = 1;

  int getIndex(String uid){
    final users = Provider.of<List<DnDUser>>(context);

    for(int i = 0; i < users.length; i++){
      if(uid == users[i].uid){
        return i;
      }
    }
    return -1;
  }

  Widget getPage(int pg, int index){
    final users = Provider.of<List<DnDUser>>(context);

    int low = (pg - 1) * 5;
    int high;
    if((pg * 5) - 1 < users[index].matchArr.length - 1){
      high = (pg * 5) - 1;
    }else{
      high = users[index].matchArr.length - 1;
    }
    List<Widget> display = List<Widget>();

    for(int i = low; i <= high; i++){
      int index2 = getIndex(users[index].matchArr[i]);

      display.add(Row(
        children: [
          Text(users[index2].name + ': ' + users[index2].discord, style: TextStyle(color: Vari.getTextColor(), fontSize: 20),),
          Spacer(),
          RaisedButton(
            child: Icon(Icons.arrow_forward),
            color: Vari.getFrontColor(),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
          )
        ],
      ));

      display.add(Spacer());
    }

    display.add(
        Row(
          children: [
            IconButton(color: Vari.getFrontColor(), icon: Icon(Icons.arrow_back_ios, color: Vari.getTextColor(),), onPressed: ((){
              if(curPage > 1){setState(() {
                curPage--;
              });}
            }),),
            Spacer(),
            Text('Page: $curPage/$pages', style: TextStyle(color: Vari.getTextColor(), fontSize: 20),),
            Spacer(),
            IconButton(color: Vari.getFrontColor(), icon: Icon(Icons.arrow_forward_ios, color: Vari.getTextColor(),), onPressed: ((){
              if(curPage < pages){ setState(() {
                curPage++;
              });}
            }),),
          ],
        )
    );



    return Container(
      child: Column(
        children: display,
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<DnDUser>>(context);

    for (int i = 0; i < users.length; i++) {
      if (Vari.getUid() == users[i].uid) {
        _index = i;
      }
    }

    pages = (users[_index].matchArr.length / 5).ceil();

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
                Center(child: Text('     Messages', style: TextStyle(fontSize: 20, color: Vari.getTextColor()),)),
              ],
            ),
          ),


          backgroundColor: Vari.getBackColor(),
          body: Container(
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                child: getPage(curPage, _index),
              ),
          )
        );
  }
}
