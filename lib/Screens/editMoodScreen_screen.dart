
import 'package:flutter/material.dart';
import 'package:moodworksapp/Classes/User.dart';
import 'package:moodworksapp/Screens/addNotesScreen_screen.dart' as selectMood;

var user = new User();
var moodid = 0;

class EditMood_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0),
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          automaticallyImplyLeading: true,
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.of(context).pushNamed('/menu'),
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
                          'Select Option',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        )),
                    SizedBox(height: 20.0),
                    Container(
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {
                                selectMood.getUserID(user, 1, 1, moodid);
                                Navigator.of(context).pushNamed('/notes');
                              },
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 30,
                                    height: 30,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Angry, Frustrated, Annoyed',
                                    style: TextStyle(fontSize: 20, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/notes');
                                selectMood.getUserID(user, 2, 1, moodid);
                              },
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 30,
                                    height: 30,
                                    color: Colors.purple,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Anxious',
                                    style: TextStyle(fontSize: 20, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            FlatButton(
                              onPressed: () {

                                Navigator.of(context).pushNamed('/notes');
                                selectMood.getUserID(user, 3, 1, moodid);

                              },
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 30,
                                    height: 30,
                                    color: Colors.yellow,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Energetic',
                                    style: TextStyle(fontSize: 20, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            FlatButton(
                              onPressed: () {

                                Navigator.of(context).pushNamed('/notes');
                                selectMood.getUserID(user, 4, 1, moodid);

                              },
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 30,
                                    height: 30,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Sad',
                                    style: TextStyle(fontSize: 20, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/notes');
                                selectMood.getUserID(user, 5, 1, moodid);
                              },
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 30,
                                    height: 30,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Happy',
                                    style: TextStyle(fontSize: 20, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            FlatButton(
                              onPressed: () {

                                Navigator.of(context).pushNamed('/notes');
                                selectMood.getUserID(user, 6, 1, moodid);
                              },
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 30,
                                    height: 30,
                                    color: Colors.black12,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Tired',
                                    style: TextStyle(fontSize: 20, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),


                          ],

                        )

                    ),


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.of(context).pushNamed('/selectmood');
        return false;
      },
    );
  }
}
void getUserID(User user1, int moodID){
  user= user1;
  moodid = moodID;
}