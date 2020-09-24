import 'package:flutter/material.dart';
import 'package:soccer_days/pages/login.dart';
import 'package:soccer_days/pages/testLogin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
