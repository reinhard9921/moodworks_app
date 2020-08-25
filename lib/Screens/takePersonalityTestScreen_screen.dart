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

  Future<bool> count() async{
    questionNum++;
    return true;
   
  }
  void updateQuestion(int num){


    setState(() {

      fetchPersonalityTest().then((value) => count());
      if(questionNum == 44){
        Navigator.of(context).pushNamed('/personmenu');
      }
      else
      {
        if(question.letter.toString() == 'C'){
          c += num;
        }
        if(question.letter.toString() == 'A'){
          a += num;
        }
        if(question.letter.toString() == 'E'){
          e += num;
        }
        if(question.letter.toString() == 'N'){
          n += num;
        }
        if(question.letter.toString() == 'O'){
          o += num;
        }

        print("C = " + c.toString() + ", A = " + a.toString() + ", E = " + e.toString() + ", N = " + n.toString() + ", O = " + o.toString());
        print(questionNum);
      }
    });
  }

}

Future<bool> fetchPersonalityTest() async {
  var jsonMap;
  var jsonData;
  var res = await http.get("http://api.moodworx.co.za:2461/Personality_Test");
  if (res.statusCode == 200) {
    jsonMap = json.decode(res.body);
  } else {}
  jsonData = jsonMap['recordset'];
  if (jsonData.length >= 1) {
    question = PersonalityTest.fromJson(jsonData[questionNum]);
    return true;
  }
}