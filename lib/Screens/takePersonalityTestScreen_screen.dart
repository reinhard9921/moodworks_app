import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:moodworksapp/Classes/PersonalityTest.dart';
import 'package:intl/intl.dart';


class PersonalityTest extends StatefulWidget {
  //LoginPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<PersonalityTest> {

  bool loading = false;
  List<PersonalityTest> _personality = List<PersonalityTest>();

  @override
  void initState() {
    super.initState();
    _populateNewsQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: _personality.length,
        itemBuilder: _buildItemsForListView,
      ),
    );
  }


  PersonalityTest question;
  List<PersonalityTest> results;
  ListTile _buildItemsForListView(BuildContext context, int index) {
 //   return ListTile(
 //     title: _personality[index].,
 //     subtitle: Text(_personality[index].question, style: TextStyle(fontSize: 18)),
 //   );
  }

  void _populateNewsQuestion() {

    fetchPersonalityTest().then((question) => {
      setState(() => {
        _personality = question
      })
    });

  }

  Future<List> fetchPersonalityTest() async {
    var jsonMap;
    var jsonData;
    var res = await http.get("http://api.moodworx.co.za/Personality_Test");
    if (res.statusCode == 200) {
    jsonMap = json.decode(res.body);
    } else {
    throw Exception;
    }

    jsonData = jsonMap['recordset'];
    if (jsonData.length == 1) {

    results = jsonData;
    }
  }

}
