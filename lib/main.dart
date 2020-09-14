import 'package:flutter/material.dart';
import 'package:soccer_days/pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoccerDays Login UI',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
