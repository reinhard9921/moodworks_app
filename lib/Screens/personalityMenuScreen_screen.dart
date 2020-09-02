import 'package:flutter/material.dart';
import 'package:moodworksapp/Screens/takePersonalityTestScreen_screen.dart' as test;
import 'package:moodworksapp/Classes/User.dart';
import 'package:moodworksapp/Screens/takePersonalityTestScreen_screen.dart' as PersonalityTest;
import 'package:moodworksapp/Screens/previousResultsScreen_screen.dart' as PersonalityTest1;
var user = new User();


class PersonalityMenu_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => PersonalityTest1.GetPreviousResult(user.userID).then((value) => PersonalityTest.questionNum = 0));
    return Scaffold(
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
                        'Personality Test',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  SizedBox(height: 20.0),
                  Container(height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        textColor: Colors.white,
                        color: Colors.black,
                        child: Text('Take Personality Test'),
                        onPressed: () {
                          test.fetchPersonalityTest(test.questionNum).then((value) => Navigator.of(context).pushNamed('/test'));
                          PersonalityTest.getUserID(user);
                        },
                      )),
                  SizedBox(height: 20.0),
                  Container(height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        textColor: Colors.white,
                        color: Colors.black,
                        child: Text('View Previous Test Results'),
                        onPressed: () {
                          PersonalityTest1.getUserData(user);
                          test.fetchPersonalityTest(test.questionNum).then((value) => Navigator.of(context).pushNamed('/prevres'));

                        },
                      )),
                  SizedBox(height: 20.0),
                  Container(height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        textColor: Colors.white,
                        color: Colors.black,
                        child: Text('Personality Type Description'),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/typedesc');
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
}

void getUserID(User user1) {
  user = user1;

}
