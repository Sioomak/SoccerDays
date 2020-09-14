import 'package:flutter/material.dart';
import 'package:soccer_days/pages/login.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(100),
          child: Text(
            'testing this screen',
            style: TextStyle(fontSize: 40),
          ),
        ),
        RaisedButton(
          child: Text('Go to Login Page'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
