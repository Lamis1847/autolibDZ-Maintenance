import 'package:autolibdz/Classes/Vehicule.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Vehicule> listVehicules = <Vehicule>[];

    Vehicule v1 = new Vehicule("Buggati", "Chiron", 'img/car.png');
    Vehicule v2 = new Vehicule("Mercedes", "AMG G-63", 'img/car2.png');
    Vehicule v3 = new Vehicule("Mercedes", "AMG G-88", 'img/car.png');
    listVehicules.add(v1);
    listVehicules.add(v2);
    listVehicules.add(v3);
    int _currentIndex = 1;

    double long = MediaQuery.of(context).size.height;
    double larg = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 25,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.theaters,
              color: (_currentIndex == 0) ? Color(0xFFFD0A4C) : Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.whatshot,
              color: (_currentIndex == 1) ? Color(0xFFFD0A4C) : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.bookmark,
              color: (_currentIndex == 2) ? Color(0xFFFD0A4C) : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.person,
              color: (_currentIndex == 3) ? Color(0xFFFD0A4C) : Colors.grey,
            ),
          )
        ],
        onTap: (index) {
          print(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
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
                      child: Icon(Icons.menu_rounded)),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: TextField(
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
                    child: Text(
                      'Véhicules',
                      style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 24, 0),
                    child: Text(
                      'Afficher tout',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          color: Color(0xff868FAC)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0.3 * long,
                child: ListView.builder(
                  itemCount: listVehicules.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(24, 8, 0, 0),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 0.56 * larg,
                                height: 0.3 * long,
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
                                      'Buggati',
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 16,
                                        color: Color(0xff252834),
                                      ),
                                    ),
                                    Text(
                                      'Chiron',
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
                                bottom: 8,
                                left: 8,
                                child: Text(
                                  'Détails',
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 16,
                                    color: Color(0xff252834),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0.3 * long -
                                    40, // top 0.3*long = longeur du container - height du container de localisation
                                left: 0.28 * larg,
                                child: Container(
                                  width: 0.28 * larg,
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
              Padding(
                padding: EdgeInsets.fromLTRB(24, 8, 0, 0),
                child: Text('Etats des Véhicules',
                    style: TextStyle(
                        color: Color(0xff252834),
                        fontFamily: 'Nunito',
                        fontSize: 16)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 8, 24, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 0.18 * long,
                      width: 0.38 * larg,
                      decoration: BoxDecoration(
                        color: Color(0xff868FAC),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                            child: Icon(
                              Icons.build,
                              size: 60,
                            ),
                          ),
                          Text(
                            'Véhicule en panne',
                            style:
                                TextStyle(fontSize: 16, fontFamily: 'Nunito'),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 0.18 * long,
                      width: 0.38 * larg,
                      decoration: BoxDecoration(
                        color: Color(0xff868FAC),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.time_to_leave_rounded,
                            size: 64,
                          ),
                          Text(
                            'Véhicule en service',
                            style:
                                TextStyle(fontSize: 16, fontFamily: 'Nunito'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
