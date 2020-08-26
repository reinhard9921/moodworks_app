import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moodworksapp/Classes/PersonalityTest.dart';
import 'package:moodworksapp/Classes/User.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:flutter/scheduler.dart';

var user = new User();
var questionNum = 0;
var question;
var c = 0, a = 0, e = 0, n = 0, o = 0;
class TakePersonalityTest extends StatefulWidget {
  //LoginPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => fetchPersonalityTest(questionNum));
    return new PersonalityTestState();
}
}

class PersonalityTestState extends State<TakePersonalityTest> {
  
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,

      child: Scaffold(
        body: new Container(
          margin: const EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.all(20.0)),
              new Text(question.question),
              new Row(),
              new RaisedButton(onPressed: () => updateQuestion(1), child: new Text("1")),
              new RaisedButton(onPressed: () => updateQuestion(2), child: new Text("2")),
              new RaisedButton(onPressed: () => updateQuestion(3), child: new Text("3")),
              new RaisedButton(onPressed: () => updateQuestion(4), child: new Text("4")),
              new RaisedButton(onPressed: () => updateQuestion(5), child: new Text("5")),

            ],
          ),
        ),
      ),
    );
  }

  void updateQuestion(int num){


    setState(() {

      fetchPersonalityTest(questionNum).then((value) => calculateType(num));
      

    });
  }
  Future<bool> calculateType(int num){
    if(questionNum == 44){
      InsertTest();
      Navigator.of(context).pushNamed('/personmenu');
    }
    else
    {
      if(question.letter.toString() == 'C'){
        c += reverse(num);
      }
      if(question.letter.toString() == 'A'){
        a += reverse(num);
      }
      if(question.letter.toString() == 'E'){
        e += reverse(num);
      }
      if(question.letter.toString() == 'N'){
        n += reverse(num);
      }
      if(question.letter.toString() == 'O'){
        o += reverse(num);
      }
      if(question.letter.toString() == 'c'){
        c += num;
      }
      if(question.letter.toString() == 'a'){
        a += num;
      }
      if(question.letter.toString() == 'e'){
        e += num;
      }
      if(question.letter.toString() == 'n'){
        n += num;
      }
      if(question.letter.toString() == 'o'){
        o += num;
      }

      print("C = " + c.toString() + ", A = " + a.toString() + ", E = " + e.toString() + ", N = " + n.toString() + ", O = " + o.toString());
      print("First " + questionNum.toString());
    }
  }
  int reverse(int number){
    if(number == 5){
      return 1;
    }
    if(number == 4){
      return 2;
    }
    if(number == 3){
      return 3;
    }
    if(number == 2){
      return 4;
    }
    if(number == 1){
      return 5;
    }

  }
}

Future<bool> fetchPersonalityTest(int num) async {
  print("Second " + questionNum.toString());
  var jsonMap;
  var jsonData;
  var res = await http.get("http://api.moodworx.co.za:2461/Personality_Test");
  if (res.statusCode == 200) {
    jsonMap = json.decode(res.body);
  } else {}
  jsonData = jsonMap['recordset'];
  if (jsonData.length >= 1) {
    question = PersonalityTest.fromJson(jsonData[num]);
    questionNum++;
    return true;
  }
}
Future<bool> InsertTest() async {
  var jsonMap;
  var jsonData;
  var date = new DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(date);
  var res = await http.get("http://api.moodworx.co.za:2461/PT_Result?userID=" + user.userID.toString() + "&ResultDate=" + formattedDate + "&TotalN=" + n.toString() + "&TotalA=" + a.toString() + "&TotalE=" + e.toString() + "&TotalO=" + o.toString() + "&TotalC=" + c.toString() + "");
  if (res.statusCode == 200) {
    jsonMap = json.decode(res.body);
  } else {}

}

void getUserID(User user1) {
  user = user1;

}

