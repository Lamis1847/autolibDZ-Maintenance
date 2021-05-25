
import 'package:shared_preferences/shared_preferences.dart';

class UserCacheController {

 
 Future<int> getConnectedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('connectedUserId')) {
      return prefs.getInt('connectedUserId') ;
    }
    return null ; 
  }

}