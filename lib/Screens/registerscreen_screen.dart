import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class Register_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController surnameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController password1Controller = TextEditingController();
    TextEditingController password2Controller = TextEditingController();
    return new Scaffold(
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
                        ),
                      ),
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
                            if(password1Controller.text == password2Controller.text){
                              Register(emailController.text, password1Controller.text, nameController.text, surnameController.text, int.parse(ageController.text)) ;
                              Navigator.of(context).pushNamed('/login');
                            }


                          },
                        )),
                    Container(
                        child: Row(
                      children: <Widget>[
                        FlatButton(
                          textColor: Colors.blue,
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
        ));
  }

  Future<bool> Register(String email, password, firstname, lastname, int age) async {

      var response = await http.get(
          'http://10.10.11.240:4000/AddUser?firstname=' +
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
}
