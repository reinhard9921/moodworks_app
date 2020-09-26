import 'package:flutter/material.dart';
import 'package:moodworksapp/Classes/MoodInfo.dart';
import 'package:moodworksapp/Classes/User.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../globalvars.dart';
var user = User();
bool _validate = false;
bool Confirmed = false;
TextEditingController nameController = TextEditingController();
TextEditingController surnameController = TextEditingController();
TextEditingController ageController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();


class EditProfileScreen_screen extends StatefulWidget {
  //MyStatefulWidget({Key key}) : super(key: key);

  @override
  EditProfileScreen createState() => EditProfileScreen();
}

class EditProfileScreen extends State<EditProfileScreen_screen> {

  @override
  Widget build(BuildContext context) {

    user = Globalvars.user1;
     nameController.text = user.firstname;
     surnameController.text = user.lastname;
     ageController.text = user.age.toString();
     emailController.text = user.email;
     passwordController.text = user.password;
    return WillPopScope(
      child: new Scaffold(

          appBar: new AppBar(
            backgroundColor: Color.fromRGBO(255, 255, 255, 0),
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            automaticallyImplyLeading: true,
            leading: IconButton(icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.of(context).pushNamed('/main'),
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
                            'Edit Profile',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 30),
                          )),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Text("Name"),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: user.firstname,
                          ),
                        ),
                      ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Text("Surname"),
                  ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          controller: surnameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText:  user.lastname,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Text("Email"),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          obscureText: false,
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: user.email,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Text("Password"),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "*******",
                            errorText: _validate ? 'Please enter Password For Confirmation' : null,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Text("Age"),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                      controller: ageController,
                      decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: user.age.toString(),

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
                            child: Text('Save Changes'),
                            onPressed:() {
                              setState(() {
                                nameController.text.isEmpty ? nameController.text = Globalvars.First_Name : _validate = false;
                                surnameController.text.isEmpty ? surnameController.text = Globalvars.Last_Name : _validate = false;
                                emailController.text.isEmpty ? emailController.text = Globalvars.Email_Address : _validate = false;
                                ageController.text.isEmpty ? ageController.text = Globalvars.User_Age : _validate = false;
                                passwordController.text.isEmpty ? _validate = true : _validate = false;

                              });
                              CheckUser(user.userID, passwordController.text);
                            },
                          )),

                    ],
                  )),
            ),
          )),
      onWillPop: () async {
        Navigator.of(context).pushNamed('/main');
        return false;
      },
    );
  }
  Future<void> EditUserProfile(String Name, Surname, email, password, age) async{

    var response = await http.get(
        'http://api.moodworx.co.za:2461/EditUser?firstname=' +
            Name +
            '&lastname=' +
            Surname +
            '&email=' +
            email +
            '&password=' +
            password +
            '&age=' +
            age.toString() +
            '&id=' +
            user.userID.toString());

  }

  Future<void> CheckUser(int id, String password) async{
    var jsonMap;
    var jsonData;
    var response = await http.get(
        'http://api.moodworx.co.za:2461/UserCheck?id=' +
            id.toString() +
            '&password=' +
            password);
    if (response.statusCode == 200) {
      jsonMap = json.decode(response.body);
    } else {
      throw Exception;
    }
    jsonData = jsonMap['recordset'];
    print(jsonData);
    if (jsonData.length == 1) {
      user = User.fromJson(jsonData[0]);
      if (password == user.password) {
        user.firstname = nameController.text;
        user.lastname =  surnameController.text;
        user.email = emailController.text;
        user.age = int.parse(ageController.text);
        Globalvars.user1 = user;
        EditUserProfile(nameController.text , surnameController.text, emailController.text, passwordController.text, ageController.text);
        Navigator.of(context).pushNamed('/main');

      }
    }

  }

}

