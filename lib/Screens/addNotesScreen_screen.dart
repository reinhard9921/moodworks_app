import 'package:flutter/material.dart';
import 'package:moodworksapp/Classes/MoodInfo.dart';
import 'package:moodworksapp/Classes/User.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:moodworksapp/Screens/selectDailyMoodScreen_screen.dart';

var user = new User();
var id = 0;
var actiontype = 0;
var moodLogID = 0;

class AddNotes_screen extends StatelessWidget {
  TextEditingController notesController = TextEditingController();

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
                children: <Widget>[
                  Container(),
                  SizedBox(height: 20.0),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Add Notes',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: notesController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
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
                        child: Text('Enter Notes'),
                        onPressed: () {
                          GetMoofInfo(id).then((value) {
                            var mood = value;
                            if (actiontype == 1) {
                              EditMood(
                                  moodLogID,
                                  user.userID,
                                  mood.moodInfoid,
                                  mood.mood.toString(),
                                  notesController.text,
                                  mood.moodDescription.toString());
                            } else {
                              newMood(
                                  mood.mood.toString(),
                                  mood.moodDescription.toString(),
                                  notesController.text,
                                  user.userID,
                                  id);
                            }
                          });
                          Navigator.of(context).pushNamed('/menu');
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

  void newMood(String mood, description, notes, int userid, moodinfoid) async {
    try {
      var jsonMap;
      var jsonData;
      var date = new DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(date);
      var response = await http.get(
          'http://10.10.11.240:4000/AddMood_Log?mood=' +
              mood +
              '&date=' +
              formattedDate +
              '&description=' +
              description +
              '&notes=' +
              notes +
              '&userid=' +
              userid.toString() +
              '&moodinfoid=' +
              moodinfoid.toString());
      if (response.statusCode == 200) {
      } else {
        throw Exception;
      }
    } on Exception catch (_) {}
  }

  Future<MoodInfo> GetMoofInfo(int id) async {
    try {
      var jsonMap;
      var jsonData;
      var response = await http
          .get("http://api.moodworx.co.za:2461/Mood_Type?id=" + id.toString());

      if (response.statusCode == 200) {
        jsonMap = json.decode(response.body);
      } else {
        throw Exception;
      }

      jsonData = jsonMap['recordset'];
      if (jsonData.length == 1) {
        var mood = MoodInfo.fromJson(jsonData[0]);
        return mood;
      }
    } on Exception catch (_) {
      return null;
    }
  }

  void EditMood(int moodID, int userID, int moodInfoID, String physicalMood,
      String notes, String moodDescription) async {

      var date = new DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(date);
      var response = await http.get("http://api.moodworx.co.za:2461/EditMood?mood=" +
          physicalMood +
          "&date=" +
          formattedDate +
          "&description=" +
          moodDescription +
          "&notes=" +
          notes +
          "&userid=" +
          userID.toString() +
          "&moodinfoid=" +
          moodInfoID.toString() +
          "&moodlogid=" +
          moodLogID.toString());

      if (response.statusCode == 200) {
      } else {
        throw Exception;
      }

  }
}

void getUserID(User user1, int moodid, int actionType, int moodlogid) {
  user = user1;
  id = moodid;
  actiontype = actionType;
  moodLogID = moodlogid;
}
