import 'package:moodworksapp/Classes/PersonalityTestResult.dart';
import 'package:spider_chart/spider_chart.dart';
import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moodworksapp/Classes/User.dart';

var ptr = new PersonalityTestResult();
var user = new User();
var a = 0.0, n = 0.0, c = 0.0, e = 0.0, o = 0.0;
class PreviousResults_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushNamed('/personmenu'),
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
                      child: Text(
                        'Previous Test Results',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  SizedBox(height: 50.0),
                  Container(
                    width: 250,
                    height: 250,
                    child: SpiderChart(
                      data: [
                        a,e,c,o,n
                      ],
                      maxValue:
                          100,
                      colors: <Color>[
                        Colors.red,
                        Colors.green,
                        Colors.blue,
                        Colors.yellow,
                        Colors.indigo,
                      ],
                      labels: ["Agreeableness","Extraversion","Conscientiousness","Openness","Neuroticism"],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    child: FlatButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blueAccent,
                        onPressed: () {}
                        )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void getUserData(User user1) {
  user = user1;
}

Future<PersonalityTestResult> GetPreviousResult(int userID) async {
  var jsonMap;
  var jsonData;
  var Response = await http
      .get('http://api.moodworx.co.za:2461/PT_Result_User?userID=${userID}');

  if (Response.statusCode == 200) {
    jsonMap = json.decode(Response.body);
  } else {
    throw Exception;
  }

  jsonData = jsonMap['recordset'];
  if (jsonData.length == 1) {
    ptr = PersonalityTestResult.fromJson(jsonData[0]);
    a = (ptr.a / 40) * 100;
    e = (ptr.e / 45) * 100;
    c = (ptr.c / 45) * 100;
    o = (ptr.o / 40) * 100;
    n = (ptr.n / 50) * 100;
    return ptr;
  } else {
    return null;
  }
}
