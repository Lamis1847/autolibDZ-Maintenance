import 'package:autolibdz/Model/VehiculeModel.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:autolibdz/Globals/Globals.dart';

class PositionPanne extends StatefulWidget {
  double longitude;
  double latitude;
  int idVehicule;
  PositionPanne(this.longitude, this.latitude, this.idVehicule);
  @override
  _PositionPanneState createState() => _PositionPanneState();
}

class _PositionPanneState extends State<PositionPanne> {
  Set<Marker> _marker = {};
  String nomVehicule;
  @override
  void initState() {
    Iterable<Vehicule> vehicule = GlobalVarsSingleton()
        .listVehicule
        .where((element) => element.numChassis == widget.idVehicule);
    nomVehicule =
        vehicule.toList()[0].marque + " " + vehicule.toList()[0].modele;
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _marker.add(
        Marker(
          markerId: MarkerId('id-1'),
          position: (LatLng(widget.latitude, widget.longitude)),
          infoWindow: InfoWindow(
              title: nomVehicule, snippet: 'Le véhicule est en panne'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _marker,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.latitude, widget.longitude),
          zoom: 15,
        ),
      ),
    );
  }
}
