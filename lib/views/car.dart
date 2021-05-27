import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Car extends StatefulWidget {
  @override
  _CarState createState() => _CarState();
}

class _CarState extends State<Car> {
  bool  status=true;
  @override
  Widget build(BuildContext context) {
    double long=MediaQuery.of(context).size.height;
    double larg=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
      body: Stack(
      children: <Widget>
      [
      Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xff252834),
        child: SingleChildScrollView(
                  child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
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

                  Row(
                       mainAxisAlignment: MainAxisAlignment.center,

                    children:<Widget>[
                        Container(
                          height: long*0.12,
                          width: larg*0.35,
                          child: Card(  
                          child: 
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                             children:<Widget>[
                               Text("Carburant",
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

                               Text("100 km",
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
                          width:5,
                        ),
                        Container(
                          height: long*0.12,
                          width: larg*0.35,
                          child: Card(  
                          child: 
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                             children:<Widget>[
                               Text("Kilométrage",
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

                               Text("45 254 km",
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

                         ]
                  ),
                        SizedBox(
                          height:5,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Container(
                             height: long*0.12,
                              width: larg*0.35,
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

                                   Text("0023 120 16",
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
                          width:5,
                        ),
                        Container(
                          height: long*0.12,
                          width: larg*0.35,
                          child: Card(  
                          child: 
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                             children:<Widget>[
                               Text("Etat",
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

                               Text("En service",
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
                          ],
                        ),
                        SizedBox(
                          height:25,
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
                     height:20,
                   ),

                  Container(
                  padding: EdgeInsets.symmetric(vertical:5),
                  width: double.infinity,
                  child: RaisedButton(
                    elevation:5,
                    onPressed: () {
                     Navigator.of(context).pushNamed("/car");
                    },
                    padding:EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    color: const Color(0xff868FAC), 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(
                          Icons.build,
                          color: Colors.white,
                          
                        ),
                        SizedBox(width:10),
                        
                      
                        Text('Plan de maintenance',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            //height: 41,
                            color: const Color(0xffffffff),
                          
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                 Container(
                  padding: EdgeInsets.symmetric(vertical:5),
                  width: double.infinity,
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

                  
                  
                    
                ]
              ),
            ),
        ),
      ),
        
      ],
    ),
      ),
    );
  }
}