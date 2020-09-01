import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';
import '../Classes/Statistics.dart';
import '../Classes/User.dart';
var stat = new Statistics();
var user = new User();


class DifferentStats_Screen extends StatelessWidget {
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
                        'Weekly History',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  SizedBox(height: 20.0),
                  Container(
                    child: PieChart(dataMap: DataMap()),
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

void getUserData(User user1){
  user = user1;
}

void getStatData(Statistics stat1){
  stat = stat1;
}


double angry, anxious,energetic, sad, happy, tired;

void convert(){
  if(stat.angry == null) {
    angry = 0.00;
  }
  else
  {
    angry = stat.angry.toDouble();
  }
  if(stat.anxious == null) {
    anxious = 0.00;
  }
  else
  {
    anxious = stat.anxious.toDouble();
  }
  if(stat.energetic == null) {
    energetic = 0.00;
  }
  else
  {
    energetic = stat.energetic.toDouble();
  }
  if(stat.sad == null) {
    sad = 0.00;
  }
  else
  {
    sad = stat.sad.toDouble();
  }
  if(stat.happy == null) {
    happy = 0.00;
  }
  else
  {
    happy = stat.happy.toDouble();
  }
  if(stat.tired == null) {
    tired = 0.00;
  }
  else
  {
    tired = stat.tired.toDouble();
  }

}

Map<String,double> DataMap(){
  convert();
  var userID = user.userID;
  Map<String, double> dataMap = new Map();
  dataMap.putIfAbsent("Angry", () => angry);
  dataMap.putIfAbsent("Anxious", () => anxious);
  dataMap.putIfAbsent("Energetic", () => energetic);
  dataMap.putIfAbsent("Sad", () => sad);
  dataMap.putIfAbsent("Happy", () => happy);
  dataMap.putIfAbsent("Tired", () => tired);
  return dataMap;
}