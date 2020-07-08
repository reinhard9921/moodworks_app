import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(SplashScreen_screen());
}

class SplashScreen_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () { Register_screen(); },
            child: const Text(
                'Register',
                style: TextStyle(fontSize: 20)
            ),
          ),
          const SizedBox(width: 100),
          RaisedButton(
            onPressed: () { Login_screen(); },
            child: const Text(
                'Log In',
                style: TextStyle(fontSize: 20)
            ),
          ),
        ]),
            decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(255, 255, 255, 1), Color.fromRGBO(81, 121, 112, 1)])
            ),
      ),
    );
  }
}
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);
  @override
  _LoginForm createState() => _LoginForm();
}

class _LoginForm extends State<MyStatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a password';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data.
                }
              },
              child: Text('Log In'),
            ),
          ),
        ],
      ),
    );
  }
}


class Login_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: MyStatefulWidget(),
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color.fromRGBO(255, 255, 255, 1), Color.fromRGBO(81, 121, 112, 1)])

    ),
    );
  }
}

class Register_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(255, 255, 255, 1), Color.fromRGBO(81, 121, 112, 1)])
        ),
      ),
    );
  }
}

class MenuSelection_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(255, 255, 255, 1), Color.fromRGBO(81, 121, 112, 1)])
        ),
      ),
    );
  }
}

class SelectDailyMood_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(255, 255, 255, 1), Color.fromRGBO(81, 121, 112, 1)])
        ),
      ),
    );
  }
}

class EditMood_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(255, 255, 255, 1), Color.fromRGBO(81, 121, 112, 1)])
        ),
      ),
    );
  }
}

class AddNotes_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(255, 255, 255, 1), Color.fromRGBO(81, 121, 112, 1)])
        ),
      ),
    );
  }
}

class ViewPrevious_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Statistics_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PastEntries_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Advice_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AllStats_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DifferentStats_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Predictions_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class OverallStats_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PersonalityMenu_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TakePersonalityTest_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PreviousResults_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TypeDescription_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
