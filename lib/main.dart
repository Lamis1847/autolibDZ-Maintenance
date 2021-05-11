import 'package:flutter/material.dart';
import 'car.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'AutolibDz',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'autolibdz'),
       routes: <String,WidgetBuilder>{
          "/car":(BuildContext context) => Car(),

       }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  
  @override
  Widget build(BuildContext context) {
    double long=MediaQuery.of(context).size.height;
    double larg=MediaQuery.of(context).size.width;
    
    return SafeArea(
          child: Scaffold(
          backgroundColor: const Color(0xffffffff),
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
                            child: Column(
                
                children: <Widget>[
                  Container(
                    width: 111.43,
                    height: 97.63,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('img/logo.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                     height: 0.08*long,
                  ),
                  
                 Text('Connexion',
                        style: const TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          //height: 41,
                          color: const Color(0xff252834),

                        ),
                        textAlign: TextAlign.center,
                        ),


                        SizedBox(
                    height: 30,
                  ),

                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color:Colors.black26,
                          blurRadius:6,
                          offset:Offset(0,2),
                        )
                      ]
                    ),
                    height: 56,
                    width: 344,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top:14),
                        prefixIcon: Icon( 
                          Icons.email,
                          color:const Color(0xff252834),
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color:Colors.black38,
                        )
                      ),
                    ),

                  ),

                  SizedBox(
                    height:20,
                  ),

                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color:Colors.black26,
                          blurRadius:6,
                          offset:Offset(0,2),
                        )
                      ]
                    ),
                    height: 56,
                    width: 344,
                    child: TextField(
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top:14),
                        prefixIcon: Icon( 
                          Icons.lock,
                          color:const Color(0xff252834),
                        ),
                        hintText: 'Mot de passe',
                        hintStyle: TextStyle(
                          color:Colors.black38,
                        )
                      ),
                    ),

                  ),

                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: (){},
                      padding: EdgeInsets.only(right: 0),
                      child: Text('Mot de passe oublié ?',
                        style:  TextStyle( 
                         fontFamily: 'Nunito',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff252834),
                       ),
                      ),
                    ),
                  ),


                  SizedBox(
                    height:20,
                  ),


                  Container(
                    padding: EdgeInsets.symmetric(vertical:25),
                    width: double.infinity,
                    child: RaisedButton(
                      elevation:5,
                      onPressed: () {
                       Navigator.of(context).pushNamed("/car");
                      },
                      padding:EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: const Color(0xffFFCB00), 
                      child: Text('Se connecter',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          //height: 41,
                          color: const Color(0xff252834),
                        
                      ),
                      ),
                    ),
                  )
                  
                ],
              ),
            ),
          ),
        ),
    );
  
    


    
  }
  
}
