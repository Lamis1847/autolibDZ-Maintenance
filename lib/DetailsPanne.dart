import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class DetailsPanne extends StatefulWidget {
  @override
  _DetailsPanneState createState() => _DetailsPanneState();
}

class _DetailsPanneState extends State<DetailsPanne> {
  bool status=false;
  @override
  Widget build(BuildContext context) {
    double long=MediaQuery.of(context).size.height;
    double larg=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color(0xff252834),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(children: [
                  Row(children: [
                    
                       Icon(
                            Icons.arrow_back_sharp,
                            color: Colors.white,
                            
                          ),
                  
                        SizedBox(
                          width:10,
                        ),

                    Expanded(
                      flex: 3,
                     child: Container(
                        child: Text("Peugeot 308",
                        style:TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: long*0.045,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xffffffff),
                        )),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                      )),
                  ],),


                  Divider(
                    color: Colors.white,
              
                  ),
                  SizedBox(
                  height:30,
                ),

                Container(
                  width: 282,
                  height: 96,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('img/carr.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                SizedBox(
                  height:30,
                ),

                Container(
                          //height: long*0.12,
                          width: larg*0.75,
                          child: Card(  
                          child: 
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                             children:<Widget>[
                               Text("Panne",
                               style:TextStyle(
                                 fontFamily: 'Nunito',
                                 fontSize: 16,
                                 fontWeight: FontWeight.w400,
                                 color: Colors.black,
                               ),
                               ),
                               SizedBox(
                                 height:3,
                               ),

                               Text("Probleme de batterie",
                               textAlign: TextAlign.left,
                               style:TextStyle(
                                 fontFamily: 'Nunito',
                                 fontSize: 14,
                                 fontWeight: FontWeight.w400,
                                 color: const Color(0xff667C8A),
                               ),
                               ),
                             ] 
                            ),
                          ),
                          ),
                        ),

                        SizedBox(
                          height:5
                        ),

                      Container(
                          //height: long*0.12,
                          width: larg*0.75,
                          child: Card(  
                          child: 
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                             children:<Widget>[
                               Text("Position",
                               style:TextStyle(
                                 fontFamily: 'Nunito',
                                 fontSize: 16,
                                 fontWeight: FontWeight.w400,
                                 color: Colors.black,
                               ),
                               ),
                               SizedBox(
                                 height:3,
                               ),

                               Text("Ain Naadja",
                               textAlign: TextAlign.left,
                               style:TextStyle(
                                 fontFamily: 'Nunito',
                                 fontSize: 14,
                                 fontWeight: FontWeight.w400,
                                 color: const Color(0xff667C8A),
                               ),
                               ),
                             ] 
                            ),
                          ),
                          ),
                        ),

                        SizedBox(
                          height:5
                        ),

                        Container(
                          //height: long*0.12,
                          width: larg*0.75,
                          child: Card(  
                          child: 
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                             children:<Widget>[
                               Text("Matricule",
                               style:TextStyle(
                                 fontFamily: 'Nunito',
                                 fontSize: 16,
                                 fontWeight: FontWeight.w400,
                                 color: Colors.black,
                               ),
                               ),
                               SizedBox(
                                 height:3,
                               ),

                               Text("12345 120 16",
                               textAlign: TextAlign.left,
                               style:TextStyle(
                                 fontFamily: 'Nunito',
                                 fontSize: 14,
                                 fontWeight: FontWeight.w400,
                                 color: const Color(0xff667C8A),
                               ),
                               ),
                             ] 
                            ),
                          ),
                          ),
                        ),

                        SizedBox(
                          height:5
                        ),

                        Container(
                          //height: long*0.12,
                          width: larg*0.75,
                          child: Card(  
                          child: 
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                             children:<Widget>[
                               Text("Description",
                               style:TextStyle(
                                 fontFamily: 'Nunito',
                                 fontSize: 16,
                                 fontWeight: FontWeight.w400,
                                 color: Colors.black,
                               ),
                               ),
                               SizedBox(
                                 height:3,
                               ),

                               Text("il y a un probléme au niveau de la batterie du véhicule",
                               textAlign: TextAlign.center,
                               style:TextStyle(
                                 fontFamily: 'Nunito',
                                 fontSize: 14,
                                 fontWeight: FontWeight.w400,
                                 color: const Color(0xff667C8A),
                               ),
                               ),
                             ] 
                            ),
                          ),
                          ),
                        ),

                        SizedBox(
                          height:5
                        ),

                        Container(
                          //height: long*0.12,
                          width: larg*0.45,
                          child: Card( 
                            color: const Color(0XffF5365C), 
                          child: 
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                             children:<Widget>[
                               Text("Signaler",
                               style:TextStyle(
                                 fontFamily: 'Nunito',
                                 fontSize: 16,
                                 fontWeight: FontWeight.w400,
                                 color: Colors.white,
                               ),
                               ),
                               SizedBox(
                                 width:6,
                               ),

                               Icon(
                        Icons.warning,
                        color: Colors.white,
                      ),



                             ] 
                            ),
                          ),
                          ),
                        ),

                        SizedBox(
                          height:20,
                        ),

                        FlutterSwitch(
                                        activeText: "En service",
                                        inactiveText: "Hors service",
                                        activeColor: const Color(0xff2DCE89),
                                        inactiveColor: const Color(0xffF5365C),
                                        activeTextFontWeight: FontWeight.bold,
                                        activeTextColor: Colors.white,
                                        inactiveTextColor: Colors.white,
                                        value: status,
                                        valueFontSize: 12.0,
                                        width: 130,
                                        borderRadius: 30.0,
                                        showOnOff: true,
                                        onToggle: (val) {
                                          setState(() {
                                            status = val;
                                          });
                                                          },
                              ),
                              SizedBox(
                                height:30,
                              ),


                  Container(  
                  padding: EdgeInsets.symmetric(vertical:5),
                  width: 0.75*larg,
                  child: RaisedButton(
                    elevation:5,
                    onPressed: () {
                     Navigator.of(context).pushNamed("/car");
                    },
                    padding:EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    color: const Color(0xffFFCB00), 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(
                          Icons.place,
                          color: const Color(0xff212529),
                          
                        ),
                        SizedBox(width:10),
                        
                      
                        Text('Localisation',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            //height: 41,
                            color: const Color(0xff212529),
                          
                        ),
                        ),
                      ],
                    ),
                  ),
                ),

                        


                ],)
              ),
            ),
          ) ,
        ],),
      ),
    
    );
  }
}