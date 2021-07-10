import 'package:autolibdz/Controllers/authenticationController.dart';
import 'package:autolibdz/Globals/Globals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double long = MediaQuery.of(context).size.height;
    double larg = MediaQuery.of(context).size.width;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

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
                  height: 0.08 * long,
                ),
                Text(
                  'Connexion',
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
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        )
                      ]),
                  height: 56,
                  width: 344,
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        prefixIcon: Icon(
                          Icons.email,
                          color: const Color(0xff252834),
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Colors.black38,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        )
                      ]),
                  height: 56,
                  width: 344,
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: const Color(0xff252834),
                        ),
                        hintText: 'Mot de passe',
                        hintStyle: TextStyle(
                          color: Colors.black38,
                        )),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {},
                    padding: EdgeInsets.only(right: 0),
                    child: Text(
                      'Mot de passe oublié ?',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff252834),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 5,
                    onPressed: () async {
                      if ((emailController.text == "") ||
                          (passwordController.text == "")) {
                      } else {
                        String email = emailController.text;
                        String password = passwordController.text;
                        Authentication authentication = new Authentication();
                        var res = await authentication.login(email, password);
                        if (res) {
                          print(
                              "after login i set connectedUserID to ${GlobalVarsSingleton().connectedUserId}");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        } else {
                          print("invalid account");
                        }
                      }
                    },
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: const Color(0xffFFCB00),
                    child: Text(
                      'Se connecter',
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
