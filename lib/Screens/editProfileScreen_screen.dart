import 'package:flutter/material.dart';
import 'package:moodworksapp/Classes/MoodInfo.dart';
import 'package:moodworksapp/Classes/User.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
var user = User();
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


    return new Scaffold(

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
                          labelText: user.password,
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
                            EditUserProfile(nameController.text , surnameController.text, emailController.text, passwordController.text, int.parse(ageController.text));
                            Navigator.of(context).pushNamed('/login');
                          },
                        )),

                  ],
                )),
          ),
        ));
  }
  Future<void> EditUserProfile(String Name, Surname, email, password, int age) async{

  var response = await http.get(
  'http://10.10.11.240:4000/EditUser? Name=' +
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

}

void getUser(User user1){
  user = user1;

}