import 'package:autolibdz/Model/PlanMaintenanceModel.dart';
import 'package:autolibdz/Model/VehiculeModel.dart';

class GlobalVarsSingleton{

  int connectedUserId ;
  List<Vehicule> listVehicule ;
  Map<int,List<PlanMaintenanceModel>> tousPlansMaintenance ;
  

  static final GlobalVarsSingleton _GlobalVarssingleton = GlobalVarsSingleton._internal();

  factory GlobalVarsSingleton() {
    return _GlobalVarssingleton;
  }

  GlobalVarsSingleton._internal();
}