import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'vari.dart';

class SortingScreen extends StatefulWidget {
  @override
  SortingScreenState createState() => SortingScreenState();
}

class SortingScreenState extends State<SortingScreen> {
  static List<bool> include = [false, false, false, false];
  static bool dm = false;
  static bool homebrew = false;
  static String favClass = 'None';
  static String edition = 'None';


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
              Center(child: Text('     Prefrences', style: TextStyle(fontSize: 20, color: Vari.getTextColor()),)),
            ],
          ),
        ),


        backgroundColor: Vari.getBackColor(),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
              child:Row(
                children: [
                  Column(children: [
                    Center(child: Text('Category', style: TextStyle(fontSize: 20, color: Vari.getTextColor())),),
                    SizedBox(height: 35,),
                    Center(child: Text('Player Type', style: TextStyle(fontSize: 20, color: Vari.getTextColor())),),
                    SizedBox(height: 45,),
                    Center(child: Text('Homebrew', style: TextStyle(fontSize: 20, color: Vari.getTextColor())),),
                    SizedBox(height: 45,),
                    Center(child: Text('Edition', style: TextStyle(fontSize: 20, color: Vari.getTextColor())),),
                    SizedBox(height: 45,),
                    Center(child: Text('Favorite Class', style: TextStyle(fontSize: 20, color: Vari.getTextColor())),),
                  ],),

                  Spacer(),

                  Column(children: [
                    Center(child: Text('Include', style: TextStyle(fontSize: 20, color: Vari.getTextColor())),),
                    SizedBox(height: 20,),
                    Center(child:
                      Checkbox(
                        value: include[0],
                        focusColor: Colors.white,
                        activeColor: Colors.red[600],
                        checkColor: Colors.white,
                        onChanged: (bool val){
                          setState(() {
                            include[0] = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(child:
                      Checkbox(
                        value: include[1],
                        focusColor: Colors.white,
                        activeColor: Colors.red[600],
                        checkColor: Colors.white,
                        onChanged: (bool val){
                          setState(() {
                            include[1] = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(child:
                      Checkbox(
                        value: include[2],
                        focusColor: Colors.white,
                        activeColor: Colors.red[600],
                        checkColor: Colors.white,
                        onChanged: (bool val){
                          setState(() {
                            include[2] = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(child:
                      Checkbox(
                        value: include[3],
                        focusColor: Colors.white,
                        activeColor: Colors.red[600],
                        checkColor: Colors.white,
                        onChanged: (bool val){
                          setState(() {
                            include[3] = val;
                          });
                        },
                      ),
                    ),
                  ],),

                  Spacer(),

                  Column(children: [
                    Center(child: Text('Preference', style: TextStyle(fontSize: 20, color: Vari.getTextColor())),),
                    SizedBox(height: 20,),
                    Center(child:
                      DropdownButton<bool>(
                        value: dm,
                        style: TextStyle(color: Colors.white, fontSize: 20,),
                        dropdownColor: Colors.red[600],
                        onChanged: (bool newVal){
                          setState(() {
                            dm = newVal;
                          });
                        },
                        //copied from Flutter documentation at: https://api.flutter.dev/flutter/material/DropdownButton-class.html
                        items: [
                          DropdownMenuItem(
                            value: true,
                            child: Text('DM'),
                          ),
                          DropdownMenuItem(
                            value: false,
                            child: Text('PC'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(child:
                      Checkbox(
                        value: homebrew,
                        focusColor: Colors.white,
                        activeColor: Colors.red[600],
                        checkColor: Colors.white,
                        onChanged: (bool val){
                          setState(() {
                            homebrew = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(child:
                      DropdownButton<String>(
                        value: edition,
                        style: TextStyle(color: Colors.white, fontSize: 20,),
                        dropdownColor: Colors.red[600],
                        onChanged: (String newVal){
                          setState(() {
                            edition = newVal;
                          });
                        },
                        //copied from Flutter documentation at: https://api.flutter.dev/flutter/material/DropdownButton-class.html
                        items: [
                          DropdownMenuItem(
                            value: 'None',
                            child: Text('None'),
                          ),
                          DropdownMenuItem(
                            value: 'DnD 1974',
                            child: Text('DnD 1974'),
                          ),
                          DropdownMenuItem(
                            value: 'Adv. DnD',
                            child: Text('Adv. DnD'),
                          ),
                          DropdownMenuItem(
                            value: 'Adv. DnD 2e',
                            child: Text('Adv. DnD 2e'),
                          ),
                          DropdownMenuItem(
                            value: 'DnD 3e',
                            child: Text('DnD 3e'),
                          ),
                          DropdownMenuItem(
                            value: 'DnD 3.5e',
                            child: Text('DnD 3.5e'),
                          ),
                          DropdownMenuItem(
                            value: 'DnD 4e',
                            child: Text('DnD 4e'),
                          ),
                          DropdownMenuItem(
                            value: 'DnD 5e',
                            child: Text('DnD 5e'),
                          )
                        ],
                      ),),
                    SizedBox(height: 20,),
                    Center(child:
                      DropdownButton<String>(
                        value: favClass,
                        style: TextStyle(color: Colors.white, fontSize: 20,),
                        dropdownColor: Colors.red[600],
                        onChanged: (String newVal){
                          setState(() {
                            favClass = newVal;
                          });
                        },
                        //copied from Flutter documentation at: https://api.flutter.dev/flutter/material/DropdownButton-class.html
                        items: [
                          DropdownMenuItem(
                            value: 'None',
                            child: Text('None'),
                          ),
                          DropdownMenuItem(
                            value: 'Cleric',
                            child: Text('Cleric'),
                          ),
                          DropdownMenuItem(
                            value: 'Bard',
                            child: Text('Bard'),
                          )
                        ],
                      )
                    ,),
                  ],),
                ],
                ),
              ),
          ),
        )
        ),
    );
  }
}


Widget oldBody = Spacer(); /*Column(
  children: [
    // Explaination Text
    Row(children: [
      Text('Category', style: TextStyle(fontSize: 20, color: Vari.getTextColor())),
      Spacer(),
      Text('Include', style: TextStyle(fontSize: 20, color: Vari.getTextColor())),
      Spacer(),
      Text('Preference', style: TextStyle(fontSize: 20, color: Vari.getTextColor())),
    ],),

    Spacer(),


    // For DM
    Row(children: [
      Text('Player Type', style: TextStyle(fontSize: 20, color: Vari.getTextColor())),
      Spacer(),
      Checkbox(
        value: include[0],
        focusColor: Colors.white,
        activeColor: Colors.red[600],
        checkColor: Colors.white,
        onChanged: (bool val){
          setState(() {
            include[0] = val;
          });
        },
      ),
      Spacer(),
      DropdownButton<bool>(
        value: dm,
        style: TextStyle(color: Colors.white, fontSize: 20,),
        dropdownColor: Colors.red[600],
        onChanged: (bool newVal){
          setState(() {
            dm = newVal;
          });
        },
        //copied from Flutter documentation at: https://api.flutter.dev/flutter/material/DropdownButton-class.html
        items: [
          DropdownMenuItem(
            value: true,
            child: Text('DM'),
          ),
          DropdownMenuItem(
            value: false,
            child: Text('PC'),
          ),
        ],
      )
    ],),

    Spacer(),


    Row(children: [
      Text('Homebrew', style: TextStyle(fontSize: 20, color: Vari.getTextColor())),
      Spacer(),
      Checkbox(
        value: include[1],
        focusColor: Colors.white,
        activeColor: Colors.red[600],
        checkColor: Colors.white,
        onChanged: (bool val){
          setState(() {
            include[1] = val;
          });
        },
      ),
      Spacer(),
      Checkbox(
        value: homebrew,
        focusColor: Colors.white,
        activeColor: Colors.red[600],
        checkColor: Colors.white,
        onChanged: (bool val){
          setState(() {
            homebrew = val;
          });
        },
      ),
    ],),

    Spacer(),


    Row(children: [
      Text('Edition', style: TextStyle(fontSize: 20, color: Vari.getTextColor())),
      Spacer(flex: 7,),
      Checkbox(
        value: include[2],
        focusColor: Colors.white,
        activeColor: Colors.red[600],
        checkColor: Colors.white,
        onChanged: (bool val){
          setState(() {
            include[2] = val;
          });
        },
      ),
      Spacer(flex: 1,),
      DropdownButton<String>(
        value: edition,
        style: TextStyle(color: Colors.white, fontSize: 20,),
        dropdownColor: Colors.red[600],
        onChanged: (String newVal){
          setState(() {
            edition = newVal;
          });
        },
        //copied from Flutter documentation at: https://api.flutter.dev/flutter/material/DropdownButton-class.html
        items: [
          DropdownMenuItem(
            value: 'None',
            child: Text('None'),
          ),
          DropdownMenuItem(
            value: 'DnD 1974',
            child: Text('DnD 1974'),
          ),
          DropdownMenuItem(
            value: 'Adv. DnD',
            child: Text('Adv. DnD'),
          ),
          DropdownMenuItem(
            value: 'Adv. DnD 2e',
            child: Text('Adv. DnD 2e'),
          ),
          DropdownMenuItem(
            value: 'DnD 3e',
            child: Text('DnD 3e'),
          ),
          DropdownMenuItem(
            value: 'DnD 3.5e',
            child: Text('DnD 3.5e'),
          ),
          DropdownMenuItem(
            value: 'DnD 4e',
            child: Text('DnD 4e'),
          ),
          DropdownMenuItem(
            value: 'DnD 5e',
            child: Text('DnD 5e'),
          )
        ],
      )
    ],),

    Spacer(),


    Row(children: [
      Text('Favorite Class', style: TextStyle(fontSize: 20, color: Vari.getTextColor())),
      Spacer(),
      Checkbox(
        value: include[3],
        focusColor: Colors.white,
        activeColor: Colors.red[600],
        checkColor: Colors.white,
        onChanged: (bool val){
          setState(() {
            include[3] = val;
          });
        },
      ),
      Spacer(),
      DropdownButton<String>(
        value: favClass,
        style: TextStyle(color: Colors.white, fontSize: 20,),
        dropdownColor: Colors.red[600],
        onChanged: (String newVal){
          setState(() {
            favClass = newVal;
          });
        },
        //copied from Flutter documentation at: https://api.flutter.dev/flutter/material/DropdownButton-class.html
        items: [
          DropdownMenuItem(
            value: 'None',
            child: Text('None'),
          ),
          DropdownMenuItem(
            value: 'Cleric',
            child: Text('Cleric'),
          ),
          DropdownMenuItem(
            value: 'Bard',
            child: Text('Bard'),
          )
        ],
      )
    ],),


    Spacer(flex: 4,)
  ],
),*/
