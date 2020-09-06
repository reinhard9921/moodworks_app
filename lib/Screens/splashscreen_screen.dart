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

    storage.ready.then((_) => fetchData()).then((value) => printStorage());
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
          child: Column(
            children: <Widget>[
              Container(child: Image.asset('assets/images/MoodworksLogo.png')),
              SizedBox(height: 570),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                buttonMinWidth: 175.0,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/register');
                    },
                    child: Text('Register', style: TextStyle(fontSize: 20)),
                  ),
                  RaisedButton(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    onPressed: () {

                      Navigator.of(context).pushNamed('/login');

                      },
                    child: const Text('Log In', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  printStorage() {
    Globalvars.userID = storage.getItem("userID").toString();
    Globalvars.First_Name = storage.getItem("First_Name");
    Globalvars.Last_Name = storage.getItem("Last_Name");
    Globalvars.Email_Address = storage.getItem("Email_Address");
    Globalvars.Password = storage.getItem("Password");
    Globalvars.User_Age = storage.getItem("User_Age").toString();
    print(storage.getItem("autologin"));
    Globalvars.rememberMe = storage.getItem("autologin");

    if(Globalvars.Email_Address != null && Globalvars.Email_Address != "" && Globalvars.rememberMe == "1") {
      SignIn(Globalvars.userID).then((value) => autologin()).then((value) => menu.getUserData(user));
    }
  }

  void autologin() {
    //Do login
      Navigator.of(context).pushNamed('/main');

  }

  Future<bool> SignIn(id) async {
    try {

      var jsonMap;
      var jsonData;
      var response = await http.get('http://api.moodworx.co.za:2461/Select_User?userID=' + id );

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


