import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moodworksapp/Classes/PersonalityTest.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:flutter/scheduler.dart';


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
          child: new Container(

            margin: const EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                Container(child: Image.asset('assets/images/MoodworksLogo.png')),
                new Padding(padding: EdgeInsets.all(20.0)),
                Text(
                  question.question,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                ),
                Text("1 being strongly disagree and 5 being strongly agree"),
                new Row(),
                ButtonBar(
                    alignment: MainAxisAlignment.center,
                    //buttonMinWidth: 175.0,
                    children: <Widget>[
                      RaisedButton(onPressed: () => updateQuestion(1), child: new Text("1")),
                      RaisedButton(onPressed: () => updateQuestion(2), child: new Text("2")),
                      RaisedButton(onPressed: () => updateQuestion(3), child: new Text("3")),
                      RaisedButton(onPressed: () => updateQuestion(4), child: new Text("4")),
                      RaisedButton(onPressed: () => updateQuestion(5), child: new Text("5")),
                    ]
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  
  
  
  void updateQuestion(int num){


    setState(() {

      fetchPersonalityTest(questionNum).then((value) => calculateType(num));
      

    });
  }
  Future<bool> calculateType(int num){
    if(questionNum == 44){
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

