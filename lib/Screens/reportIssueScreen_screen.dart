import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodworksapp/Classes/User.dart';
import 'package:moodworksapp/globalvars.dart';
import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';

var user = new User();
TextEditingController titleController = TextEditingController();
TextEditingController errorController = TextEditingController();

class ReportError_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    user = Globalvars.user1;
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
                    Container(child: Image.asset('assets/images/MoodworksLogo.png')),
                    Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Report Error/Issue",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        )),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Title',
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 150.0,
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                          controller: errorController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Error/Issue',
                        ),
                      ),
                    ),
                    Container(
                        height: 50,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          textColor: Colors.white,
                          color: Colors.black,
                          child: Text('Submit'),
                          onPressed: () {
                           InsertReport();
                            Navigator.of(context).pushNamed('/menu');
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
        Navigator.of(context).pushNamed('/menu');
        return false;
      },
    );
  }
}

void InsertReport() async {

  var res = await http.get("http://api.moodworx.co.za:2461/report?title=" + titleController.text + "&descrip=" + errorController.text);
  if (res.statusCode == 200) {

  }

}
