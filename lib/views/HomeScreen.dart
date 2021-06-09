import 'package:autolibdz/Component/BottomNavigationBar.dart';
import 'package:autolibdz/Controllers/VehiculesController.dart';
import 'package:autolibdz/Globals/Globals.dart';
import 'package:autolibdz/Model/VehiculeModel.dart';
import 'package:autolibdz/views/car.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Vehicule> listVehicules = <Vehicule>[];
  List<Vehicule> searchedListVehicules = <Vehicule>[];

  Future<void> initData() async {
    if (GlobalVarsSingleton().listVehicule == null) {
      VehiculesController vehiculesController = new VehiculesController();
      await vehiculesController.getListVehicules();
      listVehicules = GlobalVarsSingleton().listVehicule;
      setState(() {});
    } else {
      listVehicules = GlobalVarsSingleton().listVehicule;
    }

    for (int i = 0; i < listVehicules.length; i++) {
      searchedListVehicules.add(listVehicules[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    // ana agent must have at least one vehicule or its gonna cause a problem
    if (listVehicules.length == 0) {
      initData();
    }

    double long = MediaQuery.of(context).size.height;
    double larg = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBarComponent(0),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 0.02 * long,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 111.43,
                    height: 97.63,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('img/logo.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 24, 0),
                    child: TextButton(
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.remove('isConnected');
                        prefs.remove('connectedUserId');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Icon(Icons.logout),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: TextField(
                  onChanged: (stringValue) {
                    print(stringValue);
                    searchedListVehicules.clear();
                    listVehicules.forEach((element) {
                      if (element.marque
                          .toLowerCase()
                          .contains(stringValue.toLowerCase())) {
                        print(element.matricule);
                        searchedListVehicules.add(element);
                      }
                    });
                  },
                  controller: searchController,
                  style: TextStyle(
                    color: Color(0xFF100b20),
                  ),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Color(0xffF5F7FA),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      hintText: "Recherche"),
                ),
              ),
              SizedBox(
                height: 0.02 * long,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          searchedListVehicules.clear();
                          for (int i = 0; i < listVehicules.length; i++) {
                            searchedListVehicules.add(listVehicules[i]);
                          }
                        });
                      },
                      child: Text(
                        'Véhicules',
                        style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 24, 0),
                    child: FlatButton(
                      child: Text(
                        'Afficher tout',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Nunito',
                            color: Color(0xff868FAC)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/listcar");
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                //
                height: 255,
                child: ListView.builder(
                  itemCount: searchedListVehicules.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(24, 8, 0, 0),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 219,
                                height: 255,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFCB00),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              Positioned(
                                left: 8,
                                top: 8,
                                child: Column(
                                  children: [
                                    Text(
                                      searchedListVehicules[index].modele,
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 16,
                                        color: Color(0xff252834),
                                      ),
                                    ),
                                    Text(
                                      searchedListVehicules[index].marque,
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 16,
                                        color: Color(0xff868FAC),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: -10,
                                left: 8,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Car(
                                              searchedListVehicules[index],
                                              index)),
                                    );
                                  },
                                  child: Text(
                                    'Détails',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 16,
                                      color: Color(0xff252834),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 215,
                                // top 0.3*long = longeur du container - height du container de localisation
                                left: 109,
                                child: Container(
                                  width: 109,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(16)),
                                      color: Color(0xff252834)),
                                  child: InkWell(
                                    onTap: () {
                                      print(index);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'localisation  ',
                                            style: TextStyle(
                                                fontFamily: 'Nunito',
                                                color: Colors.white),
                                          ),
                                          Icon(
                                            Icons.location_on_rounded,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 80,
                                  left: 20,
                                  child: Image(
                                    image: const AssetImage('img/car.png'),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 8, 0, 0),
                child: Text('Etats des Véhicules',
                    style: TextStyle(
                        color: Color(0xff252834),
                        fontFamily: 'Nunito',
                        fontSize: 16)),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 8, 24, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      //height: 0.18 * long,
                      //width: 0.38 * larg,
                      decoration: BoxDecoration(
                        color: Color(0xff868FAC),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FlatButton(
                              child: Icon(
                                Icons.build,
                                size: 40,
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed("/carHS");
                              },
                            ),
                            Text(
                              'Véhicule en panne',
                              style:
                                  TextStyle(fontSize: 14, fontFamily: 'Nunito'),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      //height: 0.18 * long,
                      //width: 0.38 * larg,
                      decoration: BoxDecoration(
                        color: Color(0xff868FAC),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FlatButton(
                              child: Icon(
                                Icons.time_to_leave_rounded,
                                size: 40,
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed("/carS");
                              },
                            ),
                            Text(
                              'Véhicule en service',
                              style:
                                  TextStyle(fontSize: 14, fontFamily: 'Nunito'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
