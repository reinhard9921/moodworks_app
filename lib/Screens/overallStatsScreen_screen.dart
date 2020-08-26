import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '';
import 'package:moodworksapp/Classes/User.dart';
import 'package:moodworksapp/Share/loading.dart';
import 'dart:io';

class OverallStats_screen extends StatelessWidget {
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
                        'Overall Stats',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  SizedBox(height: 20.0),
                  Container(
                    height: 500,
                    color: Colors.black12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<double> getAngry(int userID) async {
    var jsonMapAngry;
    var jsonDataAngry;
    var jsonMapTotal;
    var jsonDataTotal;
    var angryResponse = await http.get('http://api.moodworx.co.za:2461/Mood_log_Stats_Angry?userID=${userID}');
    var totalResponse = await http.get('http://api.moodworx.co.za:2461/Mood_log_Stats_Total?userID=${userID}');

    if (angryResponse.statusCode == 200 && totalResponse.statusCode == 200 ) {
      jsonMapAngry = json.decode(angryResponse.body);
      jsonMapTotal = json.decode(totalResponse.body);
    } else {
      throw Exception;
    }

    jsonDataAngry = jsonMapAngry['recordset'];
    jsonDataTotal = jsonMapTotal['recordset'];
    double percentage = jsonDataAngry.Total / jsonDataTotal.Total;
    return percentage;
  }

  Future<double> getAnxious(int userID) async {
    var jsonMapAnxious;
    var jsonDataAnxious;
    var jsonMapTotal;
    var jsonDataTotal;
    var anxiousResponse = await http.get('http://api.moodworx.co.za:2461/Mood_log_Stats_Anxious?userID=${userID}');
    var totalResponse = await http.get('http://api.moodworx.co.za:2461/Mood_log_Stats_Total?userID=${userID}');

    if (anxiousResponse.statusCode == 200 && totalResponse.statusCode == 200 ) {
      jsonMapAnxious = json.decode(anxiousResponse.body);
      jsonMapTotal = json.decode(totalResponse.body);
    } else {
      throw Exception;
    }

    jsonDataAnxious = jsonMapAnxious['recordset'];
    jsonDataTotal = jsonMapTotal['recordset'];
    double percentage = jsonDataAnxious.Total / jsonDataTotal.Total;
    return percentage;
  }

  Future<double> getEnergetic(int userID) async {
    var jsonMapEnergetic;
    var jsonDataEnergetic;
    var jsonMapTotal;
    var jsonDataTotal;
    var energeticResponse = await http.get('http://api.moodworx.co.za:2461/Mood_log_Stats_Energetic?userID=${userID}');
    var totalResponse = await http.get('http://api.moodworx.co.za:2461/Mood_log_Stats_Total?userID=${userID}');

    if (energeticResponse.statusCode == 200 && totalResponse.statusCode == 200 ) {
      jsonMapEnergetic = json.decode(energeticResponse.body);
      jsonMapTotal = json.decode(totalResponse.body);
    } else {
      throw Exception;
    }

    jsonDataEnergetic = jsonMapEnergetic['recordset'];
    jsonDataTotal = jsonMapTotal['recordset'];
    double percentage = jsonDataEnergetic.Total / jsonDataTotal.Total;
    return percentage;
  }

  Future<double> getSad(int userID) async {
    var jsonMapSad;
    var jsonDataSad;
    var jsonMapTotal;
    var jsonDataTotal;
    var sadResponse = await http.get('http://api.moodworx.co.za:2461/Mood_log_Stats_Sad?userID=${userID}');
    var totalResponse = await http.get('http://api.moodworx.co.za:2461/Mood_log_Stats_Total?userID=${userID}');

    if (sadResponse.statusCode == 200 && totalResponse.statusCode == 200 ) {
      jsonMapSad = json.decode(sadResponse.body);
      jsonMapTotal = json.decode(totalResponse.body);
    } else {
      throw Exception;
    }

    jsonDataSad = jsonMapSad['recordset'];
    jsonDataTotal = jsonMapTotal['recordset'];
    double percentage = jsonDataSad.Total / jsonDataTotal.Total;
    return percentage;
  }

  Future<double> getHappy(int userID) async {
    var jsonMapHappy;
    var jsonDataHappy;
    var jsonMapTotal;
    var jsonDataTotal;
    var happyResponse = await http.get('http://api.moodworx.co.za:2461/Mood_log_Stats_Happy?userID=${userID}');
    var totalResponse = await http.get('http://api.moodworx.co.za:2461/Mood_log_Stats_Total?userID=${userID}');

    if (happyResponse.statusCode == 200 && totalResponse.statusCode == 200 ) {
      jsonMapHappy = json.decode(happyResponse.body);
      jsonMapTotal = json.decode(totalResponse.body);
    } else {
      throw Exception;
    }

    jsonDataHappy = jsonMapHappy['recordset'];
    jsonDataTotal = jsonMapTotal['recordset'];
    double percentage = jsonDataHappy.Total / jsonDataTotal.Total;
    return percentage;
  }

  Future<double> getTired(int userID) async {
    var jsonMapTired;
    var jsonDataTired;
    var jsonMapTotal;
    var jsonDataTotal;
    var tiredResponse = await http.get('http://api.moodworx.co.za:2461/Mood_log_Stats_Happy?userID=${userID}');
    var totalResponse = await http.get('http://api.moodworx.co.za:2461/Mood_log_Stats_Total?userID=${userID}');

    if (tiredResponse.statusCode == 200 && totalResponse.statusCode == 200 ) {
      jsonMapTired = json.decode(tiredResponse.body);
      jsonMapTotal = json.decode(totalResponse.body);
    } else {
      throw Exception;
    }

    jsonDataTired = jsonMapTired['recordset'];
    jsonDataTotal = jsonMapTotal['recordset'];
    double percentage = jsonDataTired.Total / jsonDataTotal.Total;
    return percentage;
  }


  }

