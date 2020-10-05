import 'package:flutter/material.dart';
import 'package:soccer_days/pages/login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:soccer_days/pages/signup.dart';
import 'package:soccer_days/pages/inviteFriends.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return null;
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            initialRoute: LoginScreen.id,
            routes: {
              LoginScreen.id: (context) => LoginScreen(),
              SignUpScreen.id: (context) => SignUpScreen(),
              InviteFriends.id: (context) => InviteFriends(),
            },
            debugShowCheckedModeBanner: false,
          );
          ;
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return null;
      },
    );
  }
}
