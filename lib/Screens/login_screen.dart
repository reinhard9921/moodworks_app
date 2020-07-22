import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '';
import 'package:moodworksapp/Classes/User.dart';
import 'package:moodworksapp/Share/loading.dart';
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
    return loading ? Loading() : Scaffold(
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
                            print(value);
                            if (value) {
                              setState(() => loading = false);
                              Navigator.of(context).pushNamed('/menu');
                            } else {
                              setState(() => loading = false);
                              //incorrect username and password
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
    try {
      var jsonMap;
      var jsonData;
      var response = await http.get('http://api.moodworks.co.za/login?email=' +
          email +
          '&password=' +
          password);

      if (response.statusCode == 200) {
        jsonMap = json.decode(response.body);
      } else {
        throw Exception;
      }

      jsonData = jsonMap['recordset'];
      print(jsonData);
      print(jsonData.length);
      if (jsonData.length == 1) {
        var user = User.fromJson(jsonData[0]);

        if (email == user.email && password == user.password) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }
  }
}
