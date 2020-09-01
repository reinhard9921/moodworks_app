
import 'package:flutter/material.dart';

class TypeDescription_screen extends StatelessWidget {
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
                        'Personality Type Description',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  SizedBox(height: 20.0),
                  Container(
                    height: 500,
                    color: Colors.black12,
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