import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

bool Agree = false;
bool cmail = false;
bool _validate = false;
bool _validate1 = false;
bool _validate2 = false;
bool _validate3 = false;
bool _validate4 = false;
bool _validate5 = false;
TextEditingController nameController = TextEditingController();
TextEditingController surnameController = TextEditingController();
TextEditingController ageController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController password1Controller = TextEditingController();
TextEditingController password2Controller = TextEditingController();

class Register_screen extends StatefulWidget {
  @override
  _Register_screenState createState() => _Register_screenState();
}

class _Register_screenState extends State<Register_screen> {
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      child: new Scaffold(
          appBar: new AppBar(
            backgroundColor: Color.fromRGBO(255, 255, 255, 0),
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pushNamed('/login'),
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
                  child: ListView(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 30),
                          )),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                            errorText: _validate
                                ? 'Please enter Value into Field'
                                : null,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          controller: surnameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Surname',
                            errorText: _validate1
                                ? 'Please enter Value into Field'
                                : null,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          controller: ageController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Age',
                            errorText: _validate2
                                ? 'Please enter Value into Field'
                                : null,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          controller: emailController,

                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            errorText: _validate3
                                ? 'Please enter Value into Field'
                                : null,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          controller: password1Controller,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            errorText: _validate4
                                ? 'Please enter Value into Field'
                                : null,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          controller: password2Controller,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirm Password',
                            errorText: _validate5
                                ? 'Please enter Value into Field'
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Align(
                        alignment: Alignment(0, -1),
                        child: InkWell(
                            child: Text("Our Privacy Policy"),
                            onTap: () async {
                              await launch(
                                  "https://sites.google.com/view/moodworkspp/home");
                            }),
                      ),
                      SizedBox(height: 20.0),
                      CheckboxListTile(
                        title: Text(
                            "Agree to our Terms & Conditions and our Privacy Polcy"),
                        value: Agree,
                        onChanged: (bool newValue) {
                          setState(() {
                            Agree = newValue;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      SizedBox(height: 20.0),
                      Container(
                          height: 50,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              //side: BorderSide(color: Colors.red)
                            ),
                            textColor: Colors.white,
                            color: Colors.black,
                            child: Text('Register'),
                            onPressed: () {


                              setState(() {
                                nameController.text.isEmpty
                                    ? _validate = true
                                    : _validate = false;
                                surnameController.text.isEmpty
                                    ? _validate1 = true
                                    : _validate1 = false;
                                emailController.text.isEmpty
                                    ? _validate2 = true
                                    : _validate2 = false;
                                ageController.text.isEmpty
                                    ? _validate3 = true
                                    : _validate3 = false;
                                password1Controller.text.isEmpty
                                    ? _validate4 = true
                                    : _validate4 = false;
                                password2Controller.text.isEmpty
                                    ? _validate5 = true
                                    : _validate5 = false;
                              });
                              EmailCheck(emailController.text);
                              if(cmail)
                                {
                                  EmailCheck(emailController.text);
                                }
                              else
                                {
                                  if(nameController.text.isNotEmpty && surnameController.text.isNotEmpty && emailController.text.isNotEmpty && ageController.text.isNotEmpty && password1Controller.text.isNotEmpty && password2Controller.text.isNotEmpty){
                                    print(Agree);
                                    if(Agree){
                                      if (password1Controller.text ==
                                          password2Controller.text) {
                                        Register(
                                            emailController.text,
                                            password1Controller.text,
                                            nameController.text,
                                            surnameController.text,
                                            int.parse(ageController.text));
                                        Navigator.of(context).pushNamed('/login');
                                      }
                                      else
                                      {
                                        setState(() {
                                          Flushbar(
                                            title:  "Warning",
                                            message:  "Please Agree to Our Terms And Conditions",
                                            duration:  Duration(seconds: 3),
                                            backgroundColor: Colors.orange,
                                          )..show(context);
                                        });
                                      }
                                    }
                                  }
                                }


                            },
                          )),
                      Container(
                          child: Row(
                        children: <Widget>[
                          FlatButton(
                            textColor: Colors.black,
                            child: Text(
                              'Already have an account?',
                              //style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/login');
                            },
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ))
                    ],
                  )),
            ),
          ),),
      onWillPop: () async {
        Navigator.of(context).pushNamed('/login');
        return false;
      },
    );
  }

  Future<bool> Register(String email, password, firstname, lastname, int age) async {
    var response = await http.get(
        'http://api.moodworx.co.za:2461/AddUser?firstname=' +
            firstname +
            '&lastname=' +
            lastname +
            '&email=' +
            email +
            '&password=' +
            password +
            '&age=' +
            age.toString() +
            '&id=0');
  }

  Future<bool> EmailCheck(String email) async {
    var jsonMap;
    var jsonData;
    var response = await http.get("http://api.moodworx.co.za:2461/checkMail?email=" + email);
    if (response.statusCode == 200) {
      jsonMap = json.decode(response.body);
    } else {
      throw Exception;
    }

    jsonData = jsonMap['recordset'];
    if (jsonData.length >= 1) {
      setState(() {
        Flushbar(
          title:  "Warning",
          message:  "Email Already Exists",
          duration:  Duration(seconds: 3),
          backgroundColor: Colors.orange,
        )..show(context);
      });
    }
    else
      {
        cmail = false;
      }
  }
}
