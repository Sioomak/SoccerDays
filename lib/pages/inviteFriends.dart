import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soccer_days/pages/login.dart';
import 'package:soccer_days/utilities/constants.dart';
import 'package:soccer_days/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InviteFriends extends StatefulWidget {
  static const String id = 'invite_screen';
  @override
  _InviteFriends createState() => _InviteFriends();
}

class _InviteFriends extends State<InviteFriends> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final User user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  Widget _buildBackArrow() {
    return FlatButton(
      padding: EdgeInsets.only(right: 700),
      onPressed: () {
        Navigator.pushNamed(context, LoginScreen.id);
      },
      child: Icon(
        Icons.arrow_back_ios,
        size: 36.0,
        color: Colors.white,
      ),
    );
  }

  Widget _buildFirstNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Your account is successfully registered:  ${loggedInUser.email} ",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              fontSize: 50),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {},
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Register',
          style: TextStyle(
            color: Color(0xFF3b5249),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF91d18b),
                      Color(0xFF519872),
                      Color(0xFF206a5d),
                      Color(0xFF004a2f),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Opacity(
                opacity: 0.4,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 200, 20, 20),
                  child: Hero(
                    tag: 'soccerBall',
                    child: Image.asset(
                      'assets/logos/ClipartKey_56184.png',
//                    width: 550,
//                    height: 550,
                    ),
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 40.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
//                      Text(
//                        'Sign In',
//                        style: TextStyle(
//                          color: Colors.white,
//                          fontFamily: 'OpenSans',
//                          fontSize: 40.0,
//                          fontWeight: FontWeight.bold,
//                        ),
//                      ),
                      _buildBackArrow(),
                      SizedBox(height: 20.0),
                      _buildFirstNameTF(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
