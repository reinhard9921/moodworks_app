import 'package:moodworksapp/Classes/PersonalityTestResult.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moodworksapp/Classes/User.dart';
import 'package:flutter/material.dart';
import 'package:moodworksapp/Classes/PersonalityType.dart';
var back = 1;
var per = new PersonalityType();

class TypeDescription_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(255, 255, 255, 0),
          title: Text(
            per.heading,
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,
                fontSize: 35),
          ),
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          automaticallyImplyLeading: true,
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => { if(back == 1){Navigator.of(context).pushNamed('/prevres')}else{Navigator.of(context).pushNamed('/advice')}},
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
                    Container(),
                    SizedBox(height: 20.0),
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(10),
                        child: Text(per.description.replaceAll("\\n", "\n"),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        )),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),onWillPop: () async {
      Navigator.of(context).pushNamed('/prevres');
      return false;
    },
    );
  }
}


Future<PersonalityType> GetPreviousResult(String car) async {
  var jsonMap;
  var jsonData;
  print(car);
  var Response = await http
      .get('http://api.moodworx.co.za:2461/Personality_Type?PerKey=' + car);
  if (Response.statusCode == 200) {
    jsonMap = json.decode(Response.body);
  } else {
    throw Exception;
  }

  jsonData = jsonMap['recordset'];
  if (jsonData.length == 1) {
    per = PersonalityType.fromJson(jsonData[0]);
    return per;
  } else {
    return null;
  }
}
