import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodworksapp/Screens/addNotesScreen_screen.dart';
import 'package:moodworksapp/Screens/login_screen.dart' as login;
import 'package:moodworksapp/Screens/menuSelectionscreen_screen.dart' as menu;
import 'package:moodworksapp/globalvars.dart';
import 'registerscreen_screen.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:moodworksapp/Classes/User.dart';
import 'package:moodworksapp/Screens/mainHome_screen.dart';
import 'dart:convert';
var user = new User();
final LocalStorage storage = new LocalStorage('login');

class SplashScreen_screen extends StatefulWidget {
  @override
  _SplashScreen_screenState createState() => _SplashScreen_screenState();
}

class _SplashScreen_screenState extends State<SplashScreen_screen> {
  @override

  void initState() {
    super.initState();

    storage.ready.then((_) => fetchData()).then((value) => CheckAutoLogin());
  }


  Widget build(BuildContext context) {



    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(81, 121, 112, 1)
              ])),
          child:  Align(
            alignment: Alignment(0, -1),
            child: Container(
                height: 400,
                width: 400,
                child: Image.asset('assets/images/MoodworksLogo.png')),
          ),
        ),
      ),
    );
  }

  printStorage() {

    Globalvars.user1 = new User(userID: storage.getItem("userID"), email: storage.getItem("Email_Address"), age: storage.getItem("User_Age"), firstname: storage.getItem("First_Name"), lastname: storage.getItem("Last_Name"), password: "");
    if(Globalvars.user1.email != null && Globalvars.user1.email != "") {
      SignIn(Globalvars.user1.userID).then((value) => autologin());
    }
  }

  void autologin() {
    //Do login

    Navigator.of(context).pushNamed('/main');

  }


  void CheckAutoLogin() {

    if(storage.getItem("autologin") == "1")
    {

      printStorage();
    }
    else
      {
        Navigator.of(context).pushNamed('/login');
      }

  }


  Future<bool> SignIn(id) async {
    try {

      var jsonMap;
      var jsonData;
      var response = await http.get('http://api.moodworx.co.za:2461/Select_User?userID=' + id.toString() );

      if (response.statusCode == 200) {
        jsonMap = json.decode(response.body);
      } else {
        throw Exception;
      }

      jsonData = jsonMap['recordset'];
      if (jsonData.length == 1) {
        user = User.fromJson(jsonData[0]);
      } else {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }
  }
}


