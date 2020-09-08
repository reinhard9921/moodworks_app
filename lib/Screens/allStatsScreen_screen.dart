import 'package:moodworksapp/Screens/overallStatsScreen_screen.dart' as year;
import 'package:moodworksapp/Screens/differentStatsScreen_screen.dart' as week;
import 'package:moodworksapp/Screens/predictionsScreen_screen.dart' as monthly;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moodworksapp/Classes/User.dart';
import '../Classes/Statistics.dart';
import '../globalvars.dart';
var stat = new Statistics();
var user = new User();

class AllStats_screen extends StatelessWidget {
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
            onPressed:() => Navigator.of(context).pushNamed('/menu'),
          ),
        ),
        body: Container(
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
                        child: Text('Weekly Statistics'),
                        onPressed: () {
                          getStatsWeek(user.userID).then((value) => week.getStatData(value)).then((value) => Navigator.of(context).pushNamed('/diffstats'));

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
                        child: Text('Monthly Statistics'),
                        onPressed: () {
                          getStatsMonth(user.userID).then((value) => monthly.getStatData(value)).then((value) => Navigator.of(context).pushNamed('/predictions'));
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
                        child: Text('Yearly Statistics'),
                        onPressed: () {
                          getStatsYear(user.userID).then((value) => year.getStatData(value)).then((value) => Navigator.of(context).pushNamed('/overstats'));

                        },
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.of(context).pushNamed('/menu');
        return false;
      },
    );
  }
}

Future<Statistics> getStatsWeek(int userID) async {
  var jsonMap;
  var jsonData;
  var Response = await http.get('http://api.moodworx.co.za:2461/Mood_Log_Stats_Week?userID=${userID}');


  if (Response.statusCode == 200) {
    jsonMap = json.decode(Response.body);
  } else {
    throw Exception;
  }
  jsonData = jsonMap['recordset'];
  if (jsonData.length >= 1) {

    stat = Statistics.fromJson(jsonData[0]);
    return stat;
  } else {
    return null;
  }

}

Future<Statistics> getStatsMonth(int userID) async {
  var jsonMap;
  var jsonData;
  var Response = await http.get('http://api.moodworx.co.za:2461/Mood_Log_Stats_Month?userID=${userID}');


  if (Response.statusCode == 200) {
    jsonMap = json.decode(Response.body);
  } else {
    throw Exception;
  }

  jsonData = jsonMap['recordset'];
  print(jsonData);
  if (jsonData.length == 1) {
    print(jsonData);

    stat = Statistics.fromJson(jsonData[0]);

    return stat;
  } else {
    return null;
  }

}

Future<Statistics> getStatsYear(int userID) async {
  var jsonMap;
  var jsonData;
  var Response = await http.get('http://api.moodworx.co.za:2461/Mood_Log_Stats_Year?userID=${userID}');


  if (Response.statusCode == 200) {
    jsonMap = json.decode(Response.body);
  } else {
    throw Exception;
  }

  jsonData = jsonMap['recordset'];
  if (jsonData.length == 1) {

    stat = Statistics.fromJson(jsonData[0]);

    return stat;
  } else {
    return null;
  }

}
