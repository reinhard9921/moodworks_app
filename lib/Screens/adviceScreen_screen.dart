import 'package:flutter/material.dart';
import 'package:moodworksapp/Screens/typeDescriptionScreen_screen.dart' as descrip;

class Advice_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'Personality Types',
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
                      child: Text('Agreeableness'),
                      onPressed: () {
                        descrip.back = 0;
                        descrip.GetPreviousResult("a").then((value) => Navigator.of(context).pushNamed('/typedesc'));
                      },
                    ),
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
                      child: Text('Extroversion'),
                      onPressed: () {
                        descrip.back = 0;
                        descrip.GetPreviousResult("e").then((value) => Navigator.of(context).pushNamed('/typedesc'));
                      },
                    ),
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
                      child: Text('Conscientiousness'),
                      onPressed: () {
                        descrip.back = 0;
                        descrip.GetPreviousResult("c").then((value) => Navigator.of(context).pushNamed('/typedesc'));
                      },
                    ),
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
                      child: Text('Openness'),
                      onPressed: () {
                        descrip.back = 0;
                        descrip.GetPreviousResult("o").then((value) => Navigator.of(context).pushNamed('/typedesc'));
                      },
                    ),
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
                      child: Text('Neuroticism'),
                      onPressed: () {
                        descrip.back = 0;
                        descrip.GetPreviousResult("n").then((value) => Navigator.of(context).pushNamed('/typedesc'));
                      },
                    ),
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
