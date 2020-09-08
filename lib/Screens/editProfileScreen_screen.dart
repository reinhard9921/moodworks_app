import 'package:flutter/material.dart';
import 'package:moodworksapp/Classes/MoodInfo.dart';
import 'package:moodworksapp/Classes/User.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:moodworksapp/globalvars.dart';
var user = User();
bool _validate = false;
bool Confirmed = false;
class EditProfileScreen_screen extends StatefulWidget {
  //MyStatefulWidget({Key key}) : super(key: key);

  @override
  EditProfileScreen createState() => EditProfileScreen();
}

class EditProfileScreen extends State<EditProfileScreen_screen> {

  @override
  Widget build(BuildContext context) {

       TextEditingController nameController = TextEditingController();
       TextEditingController surnameController = TextEditingController();
       TextEditingController ageController = TextEditingController();
       TextEditingController emailController = TextEditingController();
       TextEditingController passwordController = TextEditingController();

      user = Globalvars.user1;
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
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          obscureText: true,
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: user.email,
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
                            labelText: "*******",
                            errorText: _validate ? 'Please enter Password For Confirmation' : null,
                          ),
                        ),
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
                                nameController.text.isEmpty ? nameController.text = Globalvars.User_Age : _validate = false;
                                surnameController.text.isEmpty ? surnameController.text = Globalvars.User_Age : _validate = false;
                                emailController.text.isEmpty ? emailController.text = Globalvars.User_Age : _validate = false;
                                ageController.text.isEmpty ? ageController.text = Globalvars.User_Age : _validate = false;
                                passwordController.text.isEmpty ? _validate = true : _validate = false;
                              });
                              CheckUser(int.parse(Globalvars.userID), passwordController.text);
                              if(Confirmed)
                                {
                                  EditUserProfile(nameController.text , surnameController.text, emailController.text, passwordController.text, int.parse(ageController.text));
                                  Navigator.of(context).pushNamed('/login');
                                }
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
  Future<void> EditUserProfile(String Name, Surname, email, password, int age) async{

    var response = await http.get(
        'http://api.moodworx.co.za:2461/EditUser? Name=' +
            Name +
            '&Surname=' +
            Surname +
            '&email=' +
            email +
            '&password=' +
            password +
            '&age=' +
            age.toString() +
            '&id=0');

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
    if (jsonData.length == 1) {
      user = User.fromJson(jsonData[0]);



      if (password == user.password) {
        Confirmed = true;
        return true;
      }
      else
        {

        }
}

  }

}

