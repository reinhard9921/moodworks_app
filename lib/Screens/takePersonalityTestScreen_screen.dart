import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moodworksapp/Classes/PersonalityTest.dart';
import 'package:moodworksapp/Classes/User.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import '../globalvars.dart';

var user = new User();
var questionNum = 1;
var question;
var c = 0, a = 0, e = 0, n = 0, o = 0;
var jsonData;

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
    user = Globalvars.user1;
    return new WillPopScope(

      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0),
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          automaticallyImplyLeading: true,
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.of(context).pushNamed('/personmenu'),
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
          child: new Container(

            margin: const EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                Container(child: Image.asset('assets/images/MoodworksLogo.png')),
                new Padding(padding: EdgeInsets.all(10.0)),
                Text(question.questionNum.toString() + "/44",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
                ),
                new Padding(padding: EdgeInsets.all(10.0)),
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
    ),
      onWillPop: () async {
      Navigator.of(context).pushNamed('/personmenu');
      c = 0; a = 0; e = 0; n = 0; o = 0;
      return false;
    },
    );
  }




  void updateQuestion(int num){

    setState(() {

      nextQuestion().then((value) => calculateType(num));

    });
  }
  
  Future<bool> calculateType(int num){
    questionNum++;

    if(questionNum > 44){
      InsertTest();
      Navigator.of(context).pushNamed('/personmenu');
      c = 0; a = 0; e = 0; n = 0; o = 0;

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
Future<bool> nextQuestion() async {

    if(question.questionNum > 43){
      InsertTest();

    }
    else
      {
        question = PersonalityTest.fromJson(jsonData[questionNum]);
        if(question.questionNum == 1){

          question = PersonalityTest.fromJson(jsonData[1]);
        }
        return true;
      }
}

Future<bool> fetchPersonalityTest() async {
  var jsonMap;
  var res = await http.get("http://api.moodworx.co.za:2461/Personality_Test");
  if (res.statusCode == 200) {
    jsonMap = json.decode(res.body);
  }
  jsonData = jsonMap['recordset'];
  if (jsonData.length >= 1) {

    question = PersonalityTest.fromJson(jsonData[0]);

    return true;
  }

}

void InsertTest() async {
  var InsertJson;
  var date = new DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(date);
   var res = await http.get("http://api.moodworx.co.za:2461/PT_Result?userID=" + user.userID.toString() + "&ResultDate=" + formattedDate + "&TotalN=" + n.toString() + "&TotalA=" + a.toString() + "&TotalE=" + e.toString() + "&TotalO=" + o.toString() + "&TotalC=" + c.toString() + "");
  if (res.statusCode == 200) {

  }

  c = 0; a = 0; e = 0; n = 0; o = 0;

}


