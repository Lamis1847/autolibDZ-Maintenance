import 'package:autolibdz/Globals/Globals.dart';
import 'package:autolibdz/Model/VehiculeModel.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';

class CarTracker extends StatefulWidget {
  int numChassis;
  CarTracker(this.numChassis);
  @override
  _CarTrackerState createState() => _CarTrackerState();
}

class _CarTrackerState extends State<CarTracker> {
  Set<Marker> _marker = {};
  String nomVehicule;
  double latitude;
  double longitude;
  bool gotData = false;
  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  void initState() {
    print("-----------------------------------launching initState on ${widget.numChassis}") ;
    Iterable<Vehicule> vehicule = GlobalVarsSingleton()
        .listVehicule
        .where((element) => element.numChassis == widget.numChassis);
    nomVehicule =
        vehicule.toList()[0].marque + " " + vehicule.toList()[0].modele;
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) async {
    setState(() {
      _marker.add(
        Marker(
          markerId: MarkerId('id-1'),
          position: (LatLng(this.latitude, this.longitude)),
          infoWindow: InfoWindow(
              title: nomVehicule, snippet: ''),
        ),
      );
    });
  }

  Future<void> getInitialLatLng() async {
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data************************************ : ${snapshot.value}');
      this.latitude =
          snapshot.value["message"]["${widget.numChassis}"]["latitude"];
      this.longitude =
          snapshot.value["message"]["${widget.numChassis}"]["longitude"];
      gotData = true;
      updateMarker();
    });
  }

  void readFromDatabase() {
    databaseReference.child("message").onChildChanged.listen((event) {
      if (event.snapshot.value["id"] == widget.numChassis) {
        this.longitude = event.snapshot.value["longitude"];
        this.latitude = event.snapshot.value["latitude"];
        updateMarker();
      }
    });
  }

  void updateMarker() {
    print(
        "*********************************i m updating the marker with ${this.longitude}-----${this.latitude}");
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
