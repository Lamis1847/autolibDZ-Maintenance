import 'package:autolibdz/Globals/Globals.dart';
import 'package:autolibdz/Model/PlanMaintenanceModel.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class PlanMaintenanceController {
  PlanMaintenanceController();
  getPlanMaintenance(int numChassis) async {
    print("le numChaiss recherche est = $numChassis "); ///////////////////////
    List<PlanMaintenanceModel> listPlanMaintenance = <PlanMaintenanceModel>[];
    final url = Uri.parse(
        'https://autolib-dz.herokuapp.com/api/plan-maintenance/$numChassis');
    Response response = await get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      for (int i = 0; i < jsonResponse.length; i++) {
        PlanMaintenanceModel p = new PlanMaintenanceModel(
            jsonResponse[i]["date"],
            jsonResponse[i]["action"],
            jsonResponse[i]["numChassis"]);
        listPlanMaintenance.add(p);
      }

      GlobalVarsSingleton().tousPlansMaintenance[numChassis] =
          listPlanMaintenance;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<bool> addActionToPlanMaintenance(
      String actionName, DateTime date, int numChassis) async {
    if ((actionName != "") && (date != null)) {
      String stringDate = DateFormat("yyyy/MM/dd").format(date);
      var url =
          Uri.parse('https://autolib-dz.herokuapp.com/api/plan-maintenance/');
      Map data = {
        "date": stringDate,
        "action": actionName,
        "numChassis": numChassis,
        "idAgentMaintenance": GlobalVarsSingleton().connectedUserId
      };
      var body = convert.json.encode(data);
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: body);

      if (response.statusCode == 200) {
        PlanMaintenanceModel pmm =
            new PlanMaintenanceModel(stringDate, actionName, numChassis);
        print("inserted successfuly");
        GlobalVarsSingleton()
            .tousPlansMaintenance
            .putIfAbsent(numChassis, () => <PlanMaintenanceModel>[])
            .add(pmm);

        return true;
      } else {
        print("mafihach");
        print(response.statusCode);
        return false;
      }
    } else
      return false;
  }

  Future<bool> deleteActionPlanMaintenance(
      String actionName, int numChassis, int indexAction) async {
    if (actionName != "") {
      var url = Uri.parse(
          'https://autolib-dz.herokuapp.com/api/plan-maintenance/$numChassis');
      Map data = {
        "action": actionName,
      };
      var body = convert.json.encode(data);
      var response = await http.delete(url,
          headers: {"Content-Type": "application/json"}, body: body);

      if (response.statusCode == 200) {
     /*  GlobalVarsSingleton()
            .tousPlansMaintenance[numChassis]
            .removeAt(indexAction);*/

        return true;
      } else {
        print("mafihach");
        print(response.statusCode);
        return false;
      }
    } else
      return false;
  }
}
