import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:moodworksapp/Share/loading.dart';
import '';
import 'package:moodworksapp/Classes/User.dart';
import 'dart:io';
import 'package:moodworksapp/Classes/_screen.dart';
import 'package:moodworksapp/Screens/registerscreen_screen.dart';
import 'package:moodworksapp/Screens/menuSelectionscreen_screen.dart';

class LoginPage extends StatefulWidget {
  //LoginPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :  Scaffold(
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
            child: Center(
              child: ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
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
                        ),
                        textColor: Colors.white,
                        color: Colors.black,
                        child: Text('Login'),
                        onPressed: () {
                          setState(() => loading = true);
                          SignIn(nameController.text, passwordController.text)
                              .then((value) {
                            if (value) {
                              loading = false;
                              Navigator.of(context).pushNamed('/menu');
                            } else {
                              loading = false;
                              AlertDialog(  title: Text('AlertDialog Title'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text('Login Error'),
                                      Text('Incorrect Username and/or Password'),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Confirm'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            }
                          });
                        },
                      )),
                  Container(
                      child: Column(
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/forgot');
                        },
                        textColor: Colors.blue,
                        child: Text('Forgot Password'),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/register');
                        },
                        textColor: Colors.blue,
                        child: Text('New to Moodworks?'),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> SignIn(String email, password) async {
    var jsonData = null;
    var response = await http.get('http://api.moodworks.co.za/login?email=' +
        email +
        '&password=' +
        password);
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
    }
    Map<String, dynamic> user = jsonData;

    var data = user['recordsets'][0];
    var email_txt = data[0]['Email_Address'];
    var password_txt = data[0]['Password'];

    if (email == email_txt && password == password_txt) {
      return true;
    } else {
      return false;
    }
  }
/*
class LoginScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
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
            child: Center(
              child: ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
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
                        ),
                        textColor: Colors.white,
                        color: Colors.black,
                        child: Text('Login'),
                        onPressed: () {

                        },
                      )),
                  Container(
                      child: Column(
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/forgot');
                            },
                            textColor: Colors.blue,
                            child: Text('Forgot Password'),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/register');
                            },
                            textColor: Colors.blue,
                            child: Text('New to Moodworks?'),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


*/
}
