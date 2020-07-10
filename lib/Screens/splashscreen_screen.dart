import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart' as login;
import 'registerscreen_screen.dart';
import '';

class SplashScreen_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
            children: <Widget>[
              Container(child: Image.asset('assets/images/MoodworksLogo.png')),
              SizedBox(height: 570),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                buttonMinWidth: 175.0,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/register');
                    },
                    child: Text('Register', style: TextStyle(fontSize: 20)),
                  ),
                  RaisedButton(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                    child: const Text('Log In', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
