import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moodworksapp/Classes/MoodLog.dart';
import 'package:moodworksapp/Classes/User.dart';
import 'package:moodworksapp/Classes/MoodInfo.dart';
import 'package:moodworksapp/Screens/addNotesScreen_screen.dart' as selectMood;
import 'package:moodworksapp/Screens/editMoodScreen_screen.dart' as mood;

var user = new User();
var moodid = 0;
var moodLog = new MoodLog();

class SelectDailyMood_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
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
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  Container(),
                  SizedBox(height: 20.0),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Select Your Current Mood',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  SizedBox(height: 20.0),
                  Container(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/notes');
                              selectMood.getUserID(user, 1, 0, 0);
                            },
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Angry, Frustrated, Annoyed',
                                  style: TextStyle(fontSize: 20, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/notes');
                              selectMood.getUserID(user, 2, 0, 0);
                            },
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.purple,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Anxious',
                                  style: TextStyle(fontSize: 20, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          FlatButton(
                            onPressed: () {

                              Navigator.of(context).pushNamed('/notes');
                              selectMood.getUserID(user, 3, 0, 0);

                            },
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.yellow,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Energetic',
                                  style: TextStyle(fontSize: 20, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          FlatButton(
                            onPressed: () {

                              Navigator.of(context).pushNamed('/notes');
                              selectMood.getUserID(user, 4, 0, 0);

                            },
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Sad',
                                  style: TextStyle(fontSize: 20, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/notes');
                              selectMood.getUserID(user, 5, 0, 0);
                            },
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Happy',
                                  style: TextStyle(fontSize: 20, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          FlatButton(
                            onPressed: () {

                              Navigator.of(context).pushNamed('/notes');
                              selectMood.getUserID(user, 6, 0, 0);
                            },
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.black12,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Tired',
                                  style: TextStyle(fontSize: 20, color: Colors.black),
                                ),
                              ],
                            ),
                          ),


                        ],

                      )

                  ),

                  SizedBox(height: 20.0),
                  Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        textColor: Colors.white,
                        color: Colors.black,
                        child: Text('Edit Todays Mood'),
                        onPressed: () {
                          EditMood()
                              .then((value) {
                            moodLog = value;
                            Navigator.of(context).pushNamed('/editmood');
                            mood.getUserID(user, moodLog.moodID);
                          });



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



  Future<MoodLog> EditMood() async {
    var jsonMap;
    var jsonData;
    var response = await http.get('http://api.moodworx.co.za:2461/EditMood_ID?id=' + user.userID.toString());

    if (response.statusCode == 200) {
      jsonMap = json.decode(response.body);
    } else {
      throw Exception;
    }

    jsonData = jsonMap['recordset'];

    if (jsonData.length == 1) {
        return MoodLog.fromJson(jsonData[0]);

    } else {
    }

  }
}

void getUserID(User user1){
  user= user1;

}