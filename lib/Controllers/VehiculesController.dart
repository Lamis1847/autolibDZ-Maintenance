import 'package:autolibdz/Globals/Globals.dart';
import 'package:autolibdz/Model/VehiculeModel.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;

class VehiculesController {
  getListVehicules() async {
    int connectedUserId = GlobalVarsSingleton().connectedUserId;
    List<Vehicule> listVehicules = <Vehicule>[];
    final url = Uri.parse(
        'https://autolib-dz.herokuapp.com/api/vehicules/agents/$connectedUserId');
    Response response = await get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      //print("length${jsonResponse.length}");
      for (int i = 0; i < jsonResponse.length; i++) {
        Vehicule v = new Vehicule(
            jsonResponse[i]["modele"],
            jsonResponse[i]["marque"],
            'img/car.png',
            jsonResponse[i]["numImmatriculation"],
            jsonResponse[i]["numChassis"],
            jsonResponse[i]["etat"]);
        listVehicules.add(v);
      }
      GlobalVarsSingleton().listVehicule = listVehicules;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
