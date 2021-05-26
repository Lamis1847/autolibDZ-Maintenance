import 'package:autolibdz/Model/Vehicule.dart';

class GlobalVarsSingleton{

  int connectedUserId ;
  List<Vehicule> listVehicule ;


  static final GlobalVarsSingleton _GlobalVarssingleton = GlobalVarsSingleton._internal();

  factory GlobalVarsSingleton() {
    return _GlobalVarssingleton;
  }

  GlobalVarsSingleton._internal();
}