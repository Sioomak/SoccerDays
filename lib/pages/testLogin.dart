import 'package:flutter/material.dart';

Widget _buildBallImage() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 24.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          child: Image.asset('assets/logos/ClipartKey_56184.png'),
//
        )
      ],
    ),
  );
}
