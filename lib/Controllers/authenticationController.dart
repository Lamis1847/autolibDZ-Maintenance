
import 'package:autolibdz/Globals/Globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  Future<bool> login(String email, String password) async {
    var url = Uri.parse('https://autolib-dz.herokuapp.com/api/auth/agent');
    var response =
        await http.post(url, body: {"email": email, "motdepasse": password});
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as dynamic;
      String token = jsonResponse["token"];
      Map<String, dynamic> connectedUser = Jwt.parseJwt(token);
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isConnected', true);
      prefs.setInt("connectedUserId", connectedUser["id"]);
      GlobalVarsSingleton().connectedUserId = connectedUser["id"];
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isConnected');
    prefs.remove('connectedUserId');
    GlobalVarsSingleton().connectedUserId = null ; 
    GlobalVarsSingleton().listVehicule = null ;
    GlobalVarsSingleton().tousPlansMaintenance = null; 
  }
}
