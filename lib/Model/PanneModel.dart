class PanneModel {
  int idPanne;
  String description; 
  double latitude;
  double longitude;
  int idVehicule;
  bool etat ;
  int idAgentMaintenance ;
  PanneModel (this.idPanne,this.description,this.latitude , this.longitude , this.idVehicule , this.etat , this.idAgentMaintenance);
}