import 'dart:math';

import 'package:autolibdz/Component/BottomNavigationBar.dart';
import 'package:autolibdz/Controllers/PanneController.dart';
import 'package:autolibdz/Model/PanneModel.dart';
import 'package:autolibdz/views/DetailsPanne.dart';
import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class Panne extends StatefulWidget {
  @override
  _PanneState createState() => _PanneState();
}

class _PanneState extends State<Panne> {
  List<PanneModel> listPannes = <PanneModel>[];
  bool gotData = false;
  bool visibleAlert = false;
  Future<void> initData() async {
    PanneController panneController = new PanneController();
    listPannes = await panneController.getlistPannes();
    gotData = true;
    print("longeur from panne widget ${listPannes.length}");
    setState(() {});
  }

  void initState() {
    super.initState();
    initData();
  }

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (gotData) {
      print("i got data");
      if (listPannes.length == 0) {
        print("list est vide");
        visibleAlert = true;
      }
    }
    double long = MediaQuery.of(context).size.height;
    double larg = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarComponent(2),
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
              Visibility(
                  visible: visibleAlert,
                  child: Text("Aucune panne n'est signalé")),
              SizedBox(height: 20),
              SizedBox(
                height: 0.5 * long,
                child: ListView.builder(
                  itemCount: listPannes.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      //height: long*0.12,
                      width: double.infinity,
                      child: InkWell(
                        child: Card(
                          color: const Color(0xffFFCB00),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Panne numéro " +
                                          listPannes[index].idPanne.toString(),
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      new Random().nextInt(50).toString() +
                                          " min",
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
                                  listPannes[index].description,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          print(index);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailsPanne(listPannes[index])),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
