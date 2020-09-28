import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodworksapp/Classes/MoodInfo.dart';
import 'package:moodworksapp/Classes/User.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:moodworksapp/globalvars.dart';
import 'dart:convert';
import 'package:moodworksapp/Share/loading.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:moodworksapp/Classes/CalendarClass.dart';

import 'package:moodworksapp/Screens/selectDailyMoodScreen_screen.dart';
var list;
var user = new User();
bool isLoading = true;
var id = 0;
var _value = 1;
var _calendarController;
var arr = ['','','','','','','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','','','','','','','','','','','','','','','',''];
var arr1 = ['0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1', '0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1', '0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1', '0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1', '0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1', '0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1', '0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1', '0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1','0xFFE0F2F1'];

class mainHome_screen extends StatefulWidget {
  @override
  _mainHome_screenState createState() => _mainHome_screenState();
}

class _mainHome_screenState extends State<mainHome_screen> {
  TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    isLoading = true;

  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    user = Globalvars.user1;
    fetchData().then((value) => {setState(() {
    isLoading = false;
    })});
    return WillPopScope(
      child: isLoading ? Loading() : Scaffold(
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
              child: Column(
                children: <Widget>[
                  Row( children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        heightFactor: 1,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: GestureDetector(
                            onTap: () {Navigator.of(context).pushNamed('/editprofile');},
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage('assets/images/MoodworksLogo.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child:  Align(
                        alignment: Alignment.topRight,
                        heightFactor: 1,
                        child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: GestureDetector(
                              onTap: () {Navigator.of(context).pushNamed('/menu');},
                              child: Icon(
                                Icons.menu,
                                size: 40,
                              ),
                            )
                        ),
                      ),
                    )
                  ],),
                  SizedBox(height: 20.0,),

                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: DropdownButton(
                        itemHeight: 100,
                        value: _value,
                        items: [
                          DropdownMenuItem(
                            child: Text("January",
                            style: TextStyle(
                              fontSize: 50
                            ),
                            ),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("February",
                              style: TextStyle(
                                  fontSize: 50
                              ),
                            ),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("March",
                              style: TextStyle(
                                  fontSize: 50
                              ),
                            ),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text("April",
                              style: TextStyle(
                                  fontSize: 50
                              ),
                            ),
                            value: 4,
                          ),
                          DropdownMenuItem(
                            child: Text("May",
                              style: TextStyle(
                                  fontSize: 50
                              ),
                            ),
                            value: 5,
                          ),
                          DropdownMenuItem(
                            child: Text("June",
                              style: TextStyle(
                                  fontSize: 50
                              ),
                            ),
                            value: 6,
                          ),
                          DropdownMenuItem(
                            child: Text("July",
                              style: TextStyle(
                                  fontSize: 50
                              ),
                            ),
                            value: 7,
                          ),
                          DropdownMenuItem(
                            child: Text("August",
                              style: TextStyle(
                                  fontSize: 50
                              ),
                            ),
                            value: 8,
                          ),
                          DropdownMenuItem(
                            child: Text("September",
                              style: TextStyle(
                                  fontSize: 50
                              ),
                            ),
                            value: 9,
                          ),
                          DropdownMenuItem(
                            child: Text("October",
                              style: TextStyle(
                                  fontSize: 50
                              ),
                            ),
                            value: 10,
                          ),
                          DropdownMenuItem(
                            child: Text("November",
                              style: TextStyle(
                                  fontSize: 50
                              ),
                            ),
                            value: 11,
                          ),
                          DropdownMenuItem(
                            child: Text("December",
                              style: TextStyle(
                                  fontSize: 50
                              ),
                            ),
                            value: 12,
                          ),

                        ],
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                            print(_value);
                          });
                        }),

                  ),
                  SizedBox(height: 20.0,),

                  Row(children: <Widget>[
                    Expanded(
                      child: Text("S", textAlign: TextAlign.center,),
                    ),
                    Expanded(
                      child: Text("M", textAlign: TextAlign.center,),
                    ),
                    Expanded(
                      child: Text("T", textAlign: TextAlign.center,),
                    ),
                    Expanded(
                      child: Text("W", textAlign: TextAlign.center,),
                    ),
                    Expanded(
                      child: Text("T", textAlign: TextAlign.center,),
                    ),
                    Expanded(
                      child: Text("F", textAlign: TextAlign.center,),
                    ),
                    Expanded(
                      child: Text("S", textAlign: TextAlign.center,),
                    ),
                  ],),
                  SizedBox(height: 20.0,),
                  Row(
                    children: <Widget>[

                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[0])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[0])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[1])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[1])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[2])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[2])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[3])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[3])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[4])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[4])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[5])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[5])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[6])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[6])),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[

                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[7])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[7])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[8])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[8])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[9])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[9])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[10])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[10])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[11])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[11])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[12])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[12])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[13])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[13])),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[

                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[14])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[14])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[15])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[15])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[16])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[16])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[17])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[17])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[18])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[18])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[19])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[19])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[20])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[20])),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[

                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[21])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[21])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[22])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[22])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[23])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[23])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[24])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[2])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[25])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[2])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[26])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[26])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[27])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[27])),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[

                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[28])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[28])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[29])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[29])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[30])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[30])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[31])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[31])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[32])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[32])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[33])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[33])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[34])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[34])),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[

                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[35])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[35])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[36])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[36])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[37])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[37])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[38])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[38])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[39])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[39])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[40])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[40])),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(arr[41])
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(int.parse(arr1[41])),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 50.0),
                  Container(height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        textColor: Colors.white,
                        color: Colors.black,
                        child: Text('Enter Todays Mood'),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/selectmood');
                        },
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
      onWillPop: () async {
        return false;
      },
  );
  }
}

Future<bool> fetchData() async {

  final response = await http.get("http://api.moodworx.co.za:2461/Main_Screen?userid=" + user.userID.toString());
  var month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  if (response.statusCode == 200) { // _InternalLinkedHashMap<String, dynamic>

    list = json.decode(response.body)
        .map((data) => CalandarClass.fromJson(data))
        .toList();

    var date = new DateTime.now();
    _value = date.month;
    for (var i = 1; i <= 41; i++) {
      arr[i] = list[i].id;
      if(list[i].printd == "")
        {
          arr1[i] = '0xFFE0F2F1';
        }
      else if(list[i].printd == null)
      {
        arr1[i] = '0xFFE0F2F1';
      }
      else {
        arr1[i] = list[i].printd;
      }

    }
    
    return true;
  } else {
    throw Exception('Failed to load');
  }
}

