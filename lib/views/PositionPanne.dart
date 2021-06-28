import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class PositionPanne extends StatefulWidget {
  @override
  _PositionPanneState createState() => _PositionPanneState();
}

class _PositionPanneState extends State<PositionPanne> {
  Set<Marker>  _marker= {};

  void _onMapCreated(GoogleMapController controller){
    setState(() {
      _marker.add(
        Marker(markerId:MarkerId('id-1'),
        position: (LatLng(36.7762,3.05997)),
        infoWindow : InfoWindow(
          title:'Peugeot 206' ,
          snippet: 'Le véhicule est en panne'
         ),
        ),
        

      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers:_marker,
        initialCameraPosition: CameraPosition(
        target: LatLng(36.7762,3.05997),
        zoom: 15,
      ),
  
    ),
    );
  }
}