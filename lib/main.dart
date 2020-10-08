import 'package:flutter/material.dart';
import 'package:soccer_days/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:soccer_days/pages/signup.dart';
import 'package:soccer_days/pages/inviteFriends.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  print("firebase initialization ran");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        InviteFriends.id: (context) => InviteFriends(),
       
      },
       debugShowCheckedModeBanner: false,
    );
  }
}
