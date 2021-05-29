import 'package:autolibdz/Globals/Globals.dart';
import 'package:autolibdz/Model/PlanMaintenanceModel.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;

class PlanMaintenanceController {
  getPlanMaintenance(int numChassis) async {
    print("le numChaiss recherche est = $numChassis ");
    List<PlanMaintenanceModel> listPlanMaintenance = <PlanMaintenanceModel>[];
    final url = Uri.parse(
        'https://autolib-dz.herokuapp.com/api/plan-maintenance/$numChassis');
    Response response = await get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      for (int i = 0; i < jsonResponse.length; i++) {
        PlanMaintenanceModel p = new PlanMaintenanceModel(
          jsonResponse[i]["idPlan"],
          jsonResponse[i]["date"],
          jsonResponse[i]["action"],
        );
        listPlanMaintenance.add(p);
      }

      GlobalVarsSingleton().tousPlansMaintenance[numChassis] =
          listPlanMaintenance;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  addActionToPlanMaintenance(
      String actionName, DateTime date, int numChassis) async {
    if ((actionName != "") && (date != null)) {
      String day = date.day.toString();
      String month = date.month.toString();
      String year = date.year.toString();
      String dateInJsonFormat = year + "/" + month + "/" + day;
    }
  }
}
