import 'package:autolibdz/Component/BottomNavigationBar.dart';
import 'package:autolibdz/Globals/Globals.dart';
import 'package:autolibdz/Model/PlanMaintenanceModel.dart';
import 'package:flutter/material.dart';
import 'package:autolibdz/Controllers/PlanMaintenanceController.dart';

class DetailsPlanMaintenance extends StatefulWidget {
  int numChassis;
  int indexVehicule;
  DetailsPlanMaintenance(this.numChassis, this.indexVehicule);
  @override
  _DetailsPlanMaintenanceState createState() => _DetailsPlanMaintenanceState();
}

class _DetailsPlanMaintenanceState extends State<DetailsPlanMaintenance> {
  List<PlanMaintenanceModel> listplanMaintenance = <PlanMaintenanceModel>[];

  Future<void> initData() async {
    if (GlobalVarsSingleton().tousPlansMaintenance == null) {
      GlobalVarsSingleton().tousPlansMaintenance = new Map();
      await PlanMaintenanceController().getPlanMaintenance(widget.numChassis);
    } else if (!GlobalVarsSingleton()
        .tousPlansMaintenance
        .containsKey(widget.numChassis)) {
      await PlanMaintenanceController().getPlanMaintenance(widget.numChassis);
    }
    if (GlobalVarsSingleton()
        .tousPlansMaintenance
        .containsKey(widget.numChassis)) {
      listplanMaintenance =
          GlobalVarsSingleton().tousPlansMaintenance[widget.numChassis];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    print("//////////////////////////////////${listplanMaintenance.length}");
    if (listplanMaintenance.length == 0) {
      initData();
    }
    double long = MediaQuery.of(context).size.height;
    double larg = MediaQuery.of(context).size.width;
    TextEditingController actionPlanMaintenanceField = TextEditingController();

    print(larg);
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
                mainAxisAlignment: MainAxisAlignment.end,
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
                      Navigator.of(context).pushNamed("/PlanMaintenance");
                    },
                  ),
                  Container(
                    child: Text(
                        GlobalVarsSingleton()
                                .listVehicule[widget.indexVehicule]
                                .marque +
                            " " +
                            GlobalVarsSingleton()
                                .listVehicule[widget.indexVehicule]
                                .modele,
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
                color: const Color(0xffF4F7FC),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 3,
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
                                        width: 0, style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  hintText: "Recherche"),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 3,
                            child: ElevatedButton.icon(
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate:
                                        DateTime.now().add(Duration(days: 356)),
                                    builder: (context, child) {
                                      return SingleChildScrollView(
                                        child: Column(
                                          children: <Widget>[
                                            SizedBox(height: 60),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              width: 0.84 * larg,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                12, 12, 12, 12),
                                                        child: Text(
                                                          "Action : ",
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                              fontFamily:
                                                                  'Nunito',
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Material(
                                                    child: Container(
                                                      child: TextField(
                                                        controller:
                                                            actionPlanMaintenanceField,
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF100b20),
                                                        ),
                                                        decoration:
                                                            InputDecoration(
                                                                filled: true,
                                                                fillColor: Color(
                                                                    0xffF5F7FA),
                                                                hintText:
                                                                    "Lavage"),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 1.0),
                                              child: child,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    // ignore: sdk_version_set_literal
                                  ).then((value) async => {
                                        await PlanMaintenanceController()
                                            .addActionToPlanMaintenance(
                                          actionPlanMaintenanceField.text,
                                          value,
                                          widget.numChassis,
                                        ),
                                      });
                                },
                                label: Text(
                                  "\nAjouter\n",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xffFFCB00))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Date",
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: long * 0.020,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              )),
                          Text("Action",
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: long * 0.020,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: long * 0.4,
                child: ListView.builder(
                  itemCount: listplanMaintenance.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    final item = listplanMaintenance[index];
                    return Dismissible(
                      onDismissed: (direction) async {
                        var success = await PlanMaintenanceController()
                            .deleteActionPlanMaintenance(
                                listplanMaintenance[index].action,
                                listplanMaintenance[index].numChassis,
                                index);
                        setState(() {
                          if (success == true) {
                            listplanMaintenance.removeAt(index);
                            print("deleted successfuly");
                          }
                        });
                      },
                      confirmDismiss: (DismissDirection direction) async {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Confirmation"),
                              content: const Text(
                                  "Êtes-vous sûr de bien vouloir supprimer cet élément?"),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: const Text("Supprimer")),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text("Annuler"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      key: UniqueKey(),
                      child: Card(
                        color: const Color(0xffF4F7FC),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              SizedBox(width: 0.15 * larg),
                              Text(listplanMaintenance[index].date,
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: long * 0.020,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                              SizedBox(width: 0.15 * larg),
                              Text(listplanMaintenance[index].action,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: long * 0.020,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                              Spacer(),
                            ],
                          ),
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
