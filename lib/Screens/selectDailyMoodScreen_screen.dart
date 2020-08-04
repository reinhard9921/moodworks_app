import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:moodworksapp/Classes/MoodInfo.dart';

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
                  Container(
                    child: FutureBuilder<List>(
                      future: getMoodData(),
                      initialData: List(),
                      builder: (context, snapshot) {
                        return snapshot.hasData ?
                        new ListView.builder(
                          padding: const EdgeInsets.all(10.0),
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, i) {
                            return _buildRow(snapshot.data[i]);
                          },
                        )
                            : Center(
                          child: CircularProgressIndicator(),
                        );
                      },
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
                        child: Text('Enter Todays Mood'),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/notes');
                        },
                      )),
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
                          Navigator.of(context).pushNamed('/editmood');
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
  Widget _buildRow(MoodInfo Mood) {
    return new ListTile(
      title: new Text(Mood.mood),
    );
  }
  Future<List<MoodInfo>> getMoodData() async {
    var jsonMap;
    var jsonData;
    var response = await http.get('http://localhost:4000/Mood_Type');
    print('hello');

    if (response.statusCode == 200) {
      jsonMap = json.decode(response.body);
    } else {
      throw Exception;
    }
    print('function 2');

    jsonData = jsonMap['recordset'];

    if (jsonData.length == 1) {

      List<MoodInfo> list = jsonData.map((item) {
        return MoodInfo.fromJson(item);
      }).toList();

      return list;
    } else {
      return null;
    }







  }
}
