import 'package:localstorage/localstorage.dart';
import 'package:flutter/cupertino.dart';
import 'package:moodworksapp/Classes/_screen.dart';
import 'package:flutter/material.dart';
import 'package:moodworksapp/Classes/User.dart';
import 'package:moodworksapp/Screens/selectDailyMoodScreen_screen.dart' as selectMood;
import 'package:moodworksapp/Screens/editProfileScreen_screen.dart' as EditUser;
import 'package:moodworksapp/Screens/personalityMenuScreen_screen.dart' as PersonalityMenu;
import 'package:moodworksapp/Screens/allStatsScreen_screen.dart' as overallstats;
import 'package:moodworksapp/globalvars.dart';

var user = new User();


final LocalStorage storage = new LocalStorage('login');
class MenuSelection_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    user = Globalvars.user1;
    return WillPopScope(
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0),
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          automaticallyImplyLeading: true,
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.of(context).pushNamed('/main'),
          ),
        ),
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
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: ListView(
                    children: <Widget>[
                      Container(child: Image.asset('assets/images/MoodworksLogo.png')),
                      SizedBox(height: 20.0),
                      Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Select Option',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 30),
                          )),
/*
                      SizedBox(height: 20.0),
                      Container(height: 50,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            textColor: Colors.white,
                            color: Colors.black,
                            child: Text('Advice'),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/advice');
                            },
                          )),*/
                      SizedBox(height: 20.0),
                      Container(height: 50,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            textColor: Colors.white,
                            color: Colors.black,
                            child: Text('View Statistics'),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/allstats');
                            },
                          )),
                      SizedBox(height: 20.0),
                      Container(height: 50,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            textColor: Colors.white,
                            color: Colors.black,
                            child: Text('Personality Test'),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/personmenu');
                            },
                          )),SizedBox(height: 20.0),
                      Container(height: 50,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            textColor: Colors.white,
                            color: Colors.black,
                            child: Text('Logout'),
                            onPressed: () {
                              storage.setItem("userID", "");
                              storage.setItem("First_Name", "");
                              storage.setItem("Last_Name", "");
                              storage.setItem("Email_Address", "");
                              storage.setItem("Password", "");
                              storage.setItem("User_Age", "");
                              storage.setItem("autologin", "");
                              Globalvars.userID = storage.getItem("userID");
                              Globalvars.First_Name = storage.getItem("First_Name");
                              Globalvars.Last_Name = storage.getItem("Last_Name");
                              Globalvars.Email_Address = storage.getItem("Email_Address");
                              Globalvars.Password = storage.getItem("Password");
                              Globalvars.User_Age = storage.getItem("User_Age");
                              Globalvars.rememberMe = storage.getItem("autologin");
                              Navigator.of(context).pushNamed('/login');
                            },
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      onWillPop: () async {
        Navigator.of(context).pushNamed('/main');
        return false;
      },
    );
  }
}

