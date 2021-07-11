import 'package:autolibdz/views/PlanMaintenance.dart';
import 'package:autolibdz/views/panne.dart';
import 'package:autolibdz/views/vehiculeEnService.dart';
import 'package:autolibdz/views/vehiculeHorsService.dart';
import 'package:flutter/material.dart';
import 'Controllers/UserCacheController.dart';
import 'Globals/Globals.dart';
import 'views/HomeScreen.dart';
import 'views/LoginScreen.dart';
import 'views/listeCars.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

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
          "/PlanMaintenance": (BuildContext context) => PlanMaintenance(),
        });
  }
}
 
/*
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(PositionPanne());
}

class PositionPanne extends StatefulWidget {
  @override
  _PositionPanneState createState() => _PositionPanneState();
}

class _PositionPanneState extends State<PositionPanne> {
  Set<Marker> _marker = {};
  String nomVehicule;
  @override
  void initState() {
    nomVehicule = "said";
    super.initState();
  }

  double latitude;
  double longitude;

  void _onMapCreated(GoogleMapController controller) async {
    setState(() {
      _marker.add(
        Marker(
          markerId: MarkerId('id-1'),
          position: (LatLng(this.latitude, this.longitude)),
          infoWindow: InfoWindow(
              title: nomVehicule, snippet: 'Le véhicule est en panne'),
        ),
      );
    });
  }

  bool gotData = false;
  final databaseReference = FirebaseDatabase.instance.reference();
  Future<void> getInitialLatLng() async {
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data************************************ : ${snapshot.value}');
      this.latitude = snapshot.value["message"]["1230"]["latitude"];
      this.longitude = snapshot.value["message"]["1230"]["longitude"];
      gotData = true;
      updateMarker();
    });
  }

  void readFromDatabase() {
    databaseReference.child("message").onChildChanged.listen((event) {
      if (event.snapshot.value["id"] == 1230) {
        this.longitude = event.snapshot.value["longitude"];
        this.latitude = event.snapshot.value["latitude"];
        updateMarker();
      }
    });
  }

  void updateMarker() {
    print(
        "i m updating the marker with ${this.longitude}-----${this.latitude}");
    Marker oldMarker = _marker.first;
    Marker newMarker = Marker(
      markerId: oldMarker.markerId,
      onTap: () {
        print("tapped");
      },
      position: LatLng(this.latitude, this.longitude),
    );
    setState(() {
      _marker.clear();
      _marker.add(newMarker);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!gotData) getInitialLatLng();
    readFromDatabase();
    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _marker,
          initialCameraPosition: CameraPosition(
            target: LatLng(30.713648, 3.155969),
            zoom: 15,
          ),
        ),
      ),
    );
  }
}

*/