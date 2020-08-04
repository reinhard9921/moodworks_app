
import 'package:flutter/cupertino.dart';
import 'package:moodworksapp/Classes/_screen.dart';
import 'package:flutter/material.dart';
String firstName;


class MenuSelection_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
//      appBar: new AppBar(
//        backgroundColor: Color.fromRGBO(255, 255, 255, 0),
//        elevation: 0.0,
//        iconTheme: IconThemeData(color: Colors.black),
//      ),
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
                        firstName.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
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
                  SizedBox(height: 20.0),
                  Container(height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        textColor: Colors.white,
                        color: Colors.black,
                        child: Text('Enter Todays Mood'),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/selectmood');


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
                        child: Text('View History'),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/history');
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
                          Navigator.of(context).pushNamed('/login');
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
                        child: Text('Edit/View Profile'),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/editprofile');
                        },
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String getUserData(String username){
  firstName = username;
}