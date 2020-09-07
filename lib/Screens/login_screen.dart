import 'dart:convert';
import 'package:flushbar/flushbar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:moodworksapp/Classes/User.dart';
import 'package:moodworksapp/Share/loading.dart';
import 'dart:io';
import 'package:localstorage/localstorage.dart';
import 'package:moodworksapp/Classes/_screen.dart';
import 'package:moodworksapp/Screens/registerscreen_screen.dart';
import 'package:moodworksapp/Screens/menuSelectionscreen_screen.dart' as menu;
import 'package:moodworksapp/globalvars.dart';
var AutoLogin = false;
final LocalStorage storage = new LocalStorage('login');
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

  void initState() {
    super.initState();
    storage.ready.then((_) => printStorage());
  }

  void printStorage() {
    setState(() {

    });
  }

  Widget build(BuildContext context) {

    if(Globalvars.Email_Address != null && Globalvars.Email_Address != "") {
      Globalvars.userID = storage.getItem("userID").toString();
      Globalvars.First_Name = storage.getItem("First_Name").toString();
      Globalvars.Last_Name = storage.getItem("Last_Name").toString();
      Globalvars.Email_Address = storage.getItem("Email_Address").toString();
      Globalvars.Password = storage.getItem("Password").toString();
      Globalvars.User_Age = storage.getItem("User_Age").toString();
      Globalvars.rememberMe = storage.getItem("autologin").toString();
    }

    print(storage.getItem("email"));
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
                        "Login",
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
                  CheckboxListTile(
                    title: Text("Remeber Me"),
                    value: AutoLogin,
                    onChanged: (bool newValue) {
                      setState(() {
                        AutoLogin = newValue;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),

                  SizedBox(height: 20.0),
                  Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child:
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          textColor: Colors.white,
                          color: Colors.black,
                          child: Text('Login'),
                          onPressed: () {
                            setState(() => loading = true);
                            SignIn(nameController.text,passwordController.text)
                                .then((value) {
                              if (value) {
                                setState(() => loading = false);
                                Navigator.of(context).pushNamed('/main');
                              } else {
                                setState(() {loading = false;
                                Flushbar(
                                  title:  "Error",
                                  message:  "username or password is incorect",
                                  duration:  Duration(seconds: 3),
                                  backgroundColor: Colors.red,
                                )..show(context);
                                });
                              }
                            });
                          },
                        ),),
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
      var response = await http.get('http://api.moodworx.co.za:2461/login?email=' +
          email +
          '&password=' +
          password);

      if (response.statusCode == 200) {
        jsonMap = json.decode(response.body);
      } else {
        throw Exception;
      }

      jsonData = jsonMap['recordset'];
      if (jsonData.length == 1) {
        var user = User.fromJson(jsonData[0]);



        if (email == user.email && password == user.password) {
          if(AutoLogin ==  true){
            storage.setItem("userID", user.userID);
            storage.setItem("First_Name", user.firstname);
            storage.setItem("Last_Name", user.lastname);
            storage.setItem("Email_Address", user.email);
            storage.setItem("Password", "");
            storage.setItem("User_Age", user.age);
            storage.setItem("autologin", "1");
          }
          menu.getUserData(user);

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
