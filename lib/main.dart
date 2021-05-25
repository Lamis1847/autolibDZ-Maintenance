import 'package:autolibdz/Controllers/UserCacheController.dart';
import 'package:autolibdz/HomeScreen.dart';
import 'package:autolibdz/panne.dart';
import 'package:autolibdz/vehiculeEnService.dart';
import 'package:autolibdz/vehiculeHorsService.dart';
import 'package:flutter/material.dart';
import 'package:autolibdz/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Globals/Globals.dart';
import 'listeCars.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isThereConnectedUser = false;
  
 
  void initData() async {
    
    UserCacheController userCacheController = new UserCacheController();
    var connectedUser = await userCacheController.getConnectedUser();
    if (connectedUser !=null) {
      isThereConnectedUser = true;
      GlobalVarsSingleton().connectedUserId = connectedUser;
      setState(() {});
    } else {
      isThereConnectedUser = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isThereConnectedUser==false) {
      initData();
    }
    print ("_________////////////_____________////////////________") ;
    print(GlobalVarsSingleton().connectedUserId) ;
    print ("_________////////////_____________////////////________") ;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AutolibDz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GlobalVarsSingleton().connectedUserId!=null ? HomeScreen() : LoginScreen(),
        routes: <String, WidgetBuilder>{
          "/listcar": (BuildContext context) => ListeCars(),
          "/homeS": (BuildContext context) => HomeScreen(),
          "/carS": (BuildContext context) => VehiculeEnService(),
          "/carHS": (BuildContext context) => VehiculeHorsService(),
          "/panne": (BuildContext context) => Panne(),
          "/DetailsPanne": (BuildContext context) => Panne(),
        });
  }
}
