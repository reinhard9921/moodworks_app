
import 'package:flutter/material.dart';

class ViewPrevious_screen extends StatelessWidget {
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
                    'Select Option',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              SizedBox(height: 20.0),
              Container(
                height: 250,
                color: Colors.black12,
              ),
              SizedBox(height: 20.0),
              Container(height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    textColor: Colors.white,
                    color: Colors.black,
                    child: Text('Past stats'),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/statistics');
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
                    child: Text('Past Entries'),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/pastentries');
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
                    child: Text('Advice'),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/advice');
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
