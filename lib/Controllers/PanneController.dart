import 'package:autolibdz/Globals/Globals.dart';
import 'package:autolibdz/Model/PanneModel.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class PanneController {
  Future<List<PanneModel>> getlistPannes() async {
    int connectedUserId = GlobalVarsSingleton().connectedUserId;
    List<PanneModel> listPannes = <PanneModel>[];
    final url =
        Uri.parse('https://autolib-dz.herokuapp.com/api/pannes/unfixedPannes/$connectedUserId');
    Response response = await get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      print("longeur jsonResponse ${jsonResponse.length}");
      for (int i = 0; i < jsonResponse.length; i++) {
        PanneModel panne = new PanneModel(
          jsonResponse[i]["idPanne"],
          jsonResponse[i]["description"],
          jsonResponse[i]["latitude"],
          jsonResponse[i]["longitude"],
          jsonResponse[i]["idVehicule"],
          jsonResponse[i]["etat"],
          jsonResponse[i]["idAgentMaintenance"],
        );
        listPannes.add(panne);
      }
      return listPannes;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return listPannes;
    }
  }

  Future<void> fixPanne(int idPanne) async {
    final url = Uri.parse(
        'https://autolib-dz.herokuapp.com/api/pannes/fixPanne/$idPanne');
    Response response = await get(url);
    if (response.statusCode == 200) {
      print ("panne regler avec success") ;
    }
    else {
      print("couldnt repare panne") ;
    }
  }
}
