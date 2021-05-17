import 'package:autolibdz/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:autolibdz/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    );
  }
}
