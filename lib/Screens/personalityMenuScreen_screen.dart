
import 'package:flutter/material.dart';

class PersonalityMenu_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
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
                      Navigator.of(context).pushNamed('/test');
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
                      Navigator.of(context).pushNamed('/prevres');
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
    );
  }
}
