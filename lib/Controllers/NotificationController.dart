import 'package:autolibdz/Globals/Globals.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NotificationController {
  Future<void> sendDeviceToken() async {
    String token = await FirebaseMessaging.instance.getToken();
    var url =
        Uri.parse('https://ae2ba8e79b21.ngrok.io/api/pannes/subscribe');
    Map data = {
      "token": token,
      "idAgentMaintenance": GlobalVarsSingleton().connectedUserId 
    };
    print("i sent the data ----->>  $data");
    var body = convert.json.encode(data);
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    if (response.statusCode == 200) {
      print("token sent to backend successfuly") ; 
      return true;
    } else {
      print("couldn't send deviceToken to server due to network problem");
      print(response.statusCode);
      return false;
    }
  }
}
