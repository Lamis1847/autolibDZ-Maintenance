import 'package:autolibdz/Globals/Globals.dart';
import 'package:autolibdz/Model/VehiculeModel.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class VehiculesController {
  getListVehicules() async {
    int connectedUserId = GlobalVarsSingleton().connectedUserId;
    List<Vehicule> listVehicules = <Vehicule>[];
    print("the connected user id is $connectedUserId");
    final url = Uri.parse(
        'https://autolib-dz.herokuapp.com/api/vehicules/agents/$connectedUserId');
    Response response = await get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      print("length${jsonResponse.length}");
      for (int i = 0; i < jsonResponse.length; i++) {
        Vehicule v = new Vehicule(
            jsonResponse[i]["modele"],
            jsonResponse[i]["marque"],
            jsonResponse[i]["secureUrl"],
            jsonResponse[i]["numImmatriculation"],
            jsonResponse[i]["numChassis"],
            jsonResponse[i]["etat"]);
            if ((jsonResponse[i]["etat"])!="supprime"){
              listVehicules.add(v);
            }
        
      }
      GlobalVarsSingleton().listVehicule = listVehicules;
    } else {
      print('Request failed with status there are no vehicules to get: ${response.statusCode}.');
    }
  }

  Future<bool> setVehiculeEtat(int numChassis, String etat) async {
    final url = Uri.parse(
        'https://autolib-dz.herokuapp.com/api/vehicules/etat/$numChassis');
    Map data = {
      "etat": etat,
    };
    var body = convert.json.encode(data);
    var response = await http.put(url,
        headers: {"Content-Type": "application/json"}, body: body);
    if (response.statusCode == 200) {
      print("updated succssfuly");

      return true;
    } else {
      print("mafihach update l etat");
      print(response.statusCode);
      return false;
    }
  }
}
