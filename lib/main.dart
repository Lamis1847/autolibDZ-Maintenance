import 'package:autolibdz/views/PlanMaintenance.dart';
import 'package:autolibdz/views/car.dart';
import 'package:autolibdz/views/panne.dart';
import 'package:autolibdz/views/vehiculeEnService.dart';
import 'package:autolibdz/views/vehiculeHorsService.dart';
import 'package:flutter/material.dart';
import 'Controllers/UserCacheController.dart';
import 'Globals/Globals.dart';
import 'views/DetailsPanne.dart';
import 'views/HomeScreen.dart';
import 'views/LoginScreen.dart';
import 'views/listeCars.dart';

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
    if (connectedUser != null) {
      isThereConnectedUser = true;
      GlobalVarsSingleton().connectedUserId = connectedUser;
      setState(() {});
    } else {
      isThereConnectedUser = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isThereConnectedUser == false) {
      initData();
    }
    print(GlobalVarsSingleton().connectedUserId);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AutolibDz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GlobalVarsSingleton().connectedUserId != null
            ? HomeScreen()
            : LoginScreen(),
        routes: <String, WidgetBuilder>{
          "/listcar": (BuildContext context) => ListeCars(),
          "/homeS": (BuildContext context) => HomeScreen(),
          "/carS": (BuildContext context) => VehiculeEnService(),
          "/carHS": (BuildContext context) => VehiculeHorsService(),
          "/panne": (BuildContext context) => Panne(),
          "/DetailsPanne": (BuildContext context) => DetailsPanne(),
          "/PlanMaintenance": (BuildContext context) => PlanMaintenance(),
        });
  }
}
