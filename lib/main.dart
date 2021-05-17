import 'package:autolibdz/HomeScreen.dart';
import 'package:autolibdz/vehiculeEnService.dart';
import 'package:autolibdz/vehiculeHorsService.dart';
import 'package:flutter/material.dart';
import 'package:autolibdz/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'listeCars.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isThereConnectedUser = false;



  void initState() {
    checkConnectedUser();
  }

 
  checkConnectedUser() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    isThereConnectedUser = prefs.containsKey('isConnected');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AutolibDz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isThereConnectedUser ? HomeScreen() : LoginScreen(),
       routes: <String,WidgetBuilder>{
          "/listcar":(BuildContext context) => ListeCars(),
          "/homeS":(BuildContext context) => HomeScreen(),
          "/carS":(BuildContext context) => VehiculeEnService(),
          "/carHS":(BuildContext context) => VehiculeHorsService(),

       }
    );
  }
}
