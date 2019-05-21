import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:z_components/z-alert-dialog.dart';
import 'package:z_components/z-float-button.dart';
import 'package:z_components/z_switch.dart';
import 'package:z_components/z_picker.dart';
import 'package:z_components/z_tabbar.dart';
import 'package:z_components/z_button.dart';


import 'package:z_components/z_navigationbar.dart';
import 'package:z_components/z_text_field.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool value = false;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(), home: Home());
  }
}

class Home extends StatelessWidget{
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ZFloatButton(onPressed: (){},),
      appBar: new ZNavigationBar(
      ),
      body: new ListView(

        children: <Widget>[
          new Column(
              children: <Widget>[
                ZTextField(),

                ZSwitch(value: value, onChanged: (b) {}),
                ZButton(
                    child: Text('Show dialog!',style: new TextStyle(color: Colors.white),),
                    onPressed: () {
                      new ZPicker(
                        context: context,
                        onTimerDurationChanged: (date) {
                          date;
                        },
                      );
                    }),
                ZButton(child: Text("dialog"),onPressed: (){
                 showDialog(  context: context,
                     builder: (BuildContext context) => ZAlertDialog(title: Text("teste"),actions: <Widget>[FlatButton(child: new Icon(Icons.add),)],));
                },)



              ]),
        ],
      ),
      bottomNavigationBar: ZtabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: 0,
       iconSize: 15,
       elevation: 0.0,
       inactiveColor: Colors.red,
       activeColor: Colors.black,
       // currentIndex: _selectedIndex,
      ),
    );
  }

}
