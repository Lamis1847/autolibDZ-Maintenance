import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class Panne extends StatefulWidget {
  @override
  _PanneState createState() => _PanneState();
}

class _PanneState extends State<Panne> {
  int _bottomNavigationIndex = 0;
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double long = MediaQuery.of(context).size.height;
    double larg = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff252834),
        currentIndex: _bottomNavigationIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
        iconSize: 25,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Acceuil",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.time_to_leave_rounded,
            ),
            label: "Véhicules",
          ),
          BottomNavigationBarItem(
            label: "Pannes",
            icon: Icon(
              Icons.build,
            ),
          ),
          BottomNavigationBarItem(
            label: "Plan",
            icon: Icon(
              Icons.calendar_today_outlined,
            ),
          )
        ],
        onTap: (index) {
          print(index);
          setState(() {
            _bottomNavigationIndex = index;
          });
        },
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
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
              SizedBox(
                height: 10,
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
                    child: Text("Liste des pannes",
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
              AnimSearchBar(
                width: 400,
                textController: textController,
                onSuffixTap: () {
                  setState(() {
                    textController.clear();
                  });
                },
              ),
              SizedBox(height: 20),
              Container(
                //height: long*0.12,
                width: double.infinity,
                child: Card(
                  color: const Color(0xffFFCB00),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Batterie",
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "25 min",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff667C8A),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Il y a un probleme au niveau de la batterie du véhicule Peogeot 208",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
