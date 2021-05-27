import 'package:autolibdz/Component/BottomNavigationBar.dart';
import 'package:autolibdz/Globals/Globals.dart';
import 'package:autolibdz/Model/VehiculeModel.dart';
import 'package:autolibdz/views/DetailsPlanMaintenance.dart';
import 'package:flutter/material.dart';

class PlanMaintenance extends StatefulWidget {
  @override
  _PlanMaintenanceState createState() => _PlanMaintenanceState();
}

class _PlanMaintenanceState extends State<PlanMaintenance> {
  List<Vehicule> listVehicules = <Vehicule>[];

  Future<void> initData() async {
    listVehicules = GlobalVarsSingleton().listVehicule;
  }

  @override
  Widget build(BuildContext context) {
    initData();
    double long = MediaQuery.of(context).size.height;
    double larg = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBarComponent(3),
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
                ],
              ),
              Row(
                children: [
                  FlatButton(
                    child: Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/homeS");
                    },
                  ),
                  Container(
                    child: Text("Plan de maintenance",
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: long * 0.035,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ),
                  Expanded(flex: 4, child: Container()),
                ],
              ),
              SizedBox(height: 20),
              Card(
                color: const Color(0xffFFCB00),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text("véhicules",
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: long * 0.020,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              )),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text("Plan de maintenance",
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: long * 0.020,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              )),
                        ),
                      ]),
                ),
              ),
              SizedBox(
                //
                height: long * 0.6,
                child: ListView.builder(
                  itemCount: listVehicules.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 70.43,
                                  height: 24.63,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: const AssetImage('img/carr.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      listVehicules[index].marque,
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: long * 0.020,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      listVehicules[index].modele,
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: long * 0.020,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailsPlanMaintenance(
                                                  listVehicules[index]
                                                      .numChassis,
                                                  index)),
                                    );
                                  },
                                  child: Text(
                                    "Consulter",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xffFFCB00))),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
