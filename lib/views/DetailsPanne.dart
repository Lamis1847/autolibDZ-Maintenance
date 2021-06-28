import 'package:autolibdz/Controllers/PanneController.dart';
import 'package:autolibdz/Globals/Globals.dart';
import 'package:autolibdz/Model/PanneModel.dart';
import 'package:autolibdz/Model/VehiculeModel.dart';
import 'package:autolibdz/views/PositionPanne.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class DetailsPanne extends StatefulWidget {
  PanneModel panne;
  DetailsPanne(this.panne);
  @override
  _DetailsPanneState createState() => _DetailsPanneState();
}

class _DetailsPanneState extends State<DetailsPanne> {
  Vehicule vehiculeEnPanne;
  bool status = false;
  initState() {
    Iterable<Vehicule> vehicules = GlobalVarsSingleton()
        .listVehicule
        .where((element) => element.numChassis == widget.panne.idVehicule);
    vehiculeEnPanne = vehicules.toList()[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double long = MediaQuery.of(context).size.height;
    double larg = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color(0xff252834),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: Text(
                                vehiculeEnPanne.marque +
                                    " " +
                                    vehiculeEnPanne.modele,
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: long * 0.045,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xffffffff),
                                )),
                          ),
                        ),
                        Expanded(flex: 4, child: Container()),
                      ],
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 282,
                      height: 96,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('img/carr.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      //height: long*0.12,
                      width: larg * 0.75,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  "Panne",
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  widget.panne.description,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff667C8A),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      //height: long*0.12,
                      width: larg * 0.75,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  "Matricule",
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  vehiculeEnPanne.numChassis.toString(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff667C8A),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      //height: long*0.12,
                      width: larg * 0.75,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  "Description",
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "il y a un probléme au niveau de la véhicule " +
                                      vehiculeEnPanne.marque +
                                      " " +
                                      vehiculeEnPanne.modele,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff667C8A),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FlutterSwitch(
                      activeText: "Réparé",
                      inactiveText: "En panne",
                      activeColor: const Color(0xff2DCE89),
                      inactiveColor: const Color(0xffF5365C),
                      activeTextFontWeight: FontWeight.bold,
                      activeTextColor: Colors.white,
                      inactiveTextColor: Colors.white,
                      value: status,
                      valueFontSize: 12.0,
                      width: 130,
                      borderRadius: 30.0,
                      showOnOff: true,
                      onToggle: (val) async {
                        await PanneController().fixPanne(widget.panne.idPanne);

                        setState(() {
                          status = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: 0.75 * larg,
                      child: RaisedButton(
                        elevation: 5,
                        onPressed: () {
                          //Navigator.of(context).pushNamed("/car");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PositionPanne(
                                    widget.panne.longitude,
                                    widget.panne.latitude,
                                    widget.panne.idVehicule),
                              ));
                        },
                        padding: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        color: const Color(0xffFFCB00),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.place,
                              color: const Color(0xff212529),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Localisation',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                //height: 41,
                                color: const Color(0xff212529),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
