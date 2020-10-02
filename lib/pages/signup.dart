import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soccer_days/pages/inviteFriends.dart';
import 'package:soccer_days/pages/login.dart';
import 'package:soccer_days/utilities/constants.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'signUp_screen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String _fName;
  String _lName;
//  String _phoneNumber;
  String _email;
  String _selectedPosition = 'Defender';
  DateTime _selectedDate = DateTime.now();

  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

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
          'First Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Opacity(
          opacity: 0.8,
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 50.0,
            child: TextFormField(
              textAlign: TextAlign.center,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter your first name";
                } else
                  return null;
              },
              onSaved: (String value) {
                _fName = value;
              },
              keyboardType: TextInputType.text,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                hintText: 'Enter your first name',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLastNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Last Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Opacity(
          opacity: 0.8,
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 50.0,
            child: TextFormField(
              textAlign: TextAlign.center,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter your last name";
                } else
                  return null;
              },
              onSaved: (String value) {
                _lName = value;
              },
              keyboardType: TextInputType.text,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                hintText: 'Enter your last name',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }

//  Widget _buildPhoneNumberTF() {
//    // This widget is not currently being used in UI
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        Text(
//          'Phone Number',
//          style: kLabelStyle,
//        ),
//        SizedBox(height: 10.0),
//        Opacity(
//          opacity: 0.8,
//          child: Container(
//            alignment: Alignment.centerLeft,
//            decoration: kBoxDecorationStyle,
//            height: 50.0,
//            child: TextFormField(
//              textAlign: TextAlign.center,
//              validator: (value) {
//                if (value.isEmpty) {
//                  return "Please enter your phone number";
//                } else
//                  return null;
//              },
//              onSaved: (String value) {
//                _phoneNumber = value;
//              },
//              keyboardType: TextInputType.number,
//              style: TextStyle(
//                color: Colors.white,
//                fontFamily: 'OpenSans',
//              ),
//              decoration: InputDecoration(
//                border: InputBorder.none,
//                contentPadding: EdgeInsets.only(top: 14.0),
//                prefixIcon: Icon(
//                  Icons.phone,
//                  color: Colors.white,
//                ),
//                hintText: 'Enter your phone number',
//                hintStyle: kHintTextStyle,
//              ),
//            ),
//          ),
//        ),
//      ],
//    );
//  }

  Widget _buildDateOfBirthTF() {
    final format = DateFormat("yyyy-MM-dd");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Date of Birth',
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Opacity(
          opacity: 0.8,
          child: DateTimeField(
            format: format,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFF206a5d),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide.none,
              ),
              hintText: ' Select Your Date of Birth',
              hintStyle: kHintTextStyle,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
            ),
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100),
              ).then((currentValue) => _selectedDate = currentValue);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPositionSelect() {
    //start dropDown menu method
    List<DropdownMenuItem> getDropdownItems() {
      List<DropdownMenuItem<String>> dropdownItems = [];

      for (int i = 0; i < playersPositionsList.length; i++) {
        String position = playersPositionsList[i];

        var newItem = DropdownMenuItem(
          child: Text(
            position,
          ),
          value: position,
        );
        dropdownItems.add(newItem);
      }
      return dropdownItems;
    }
    // end of dropDown menu method

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Preferred Positions',
          style: kLabelStyle,
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: DropdownButton<String>(
              dropdownColor: Color(0xFF065446),
              autofocus: true,

              //This dropdown menu should eventually be changed to a multiSelect menu

              value: _selectedPosition,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              icon: Icon(
                Icons.touch_app,
                color: Colors.white,
              ),
              items: getDropdownItems(),
              onChanged: (value) {
                setState(() {
                  _selectedPosition = value;
                });
                print(_selectedPosition);
              }),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Opacity(
          opacity: 0.8,
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 50.0,
            child: TextFormField(
              textAlign: TextAlign.center,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(
                        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                    .hasMatch(value)) {
                  return 'Please enter a valid email Address';
                }
                return null;
              },
              onSaved: (String value) {
                _email = value;
              },
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Enter your Email',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Opacity(
          opacity: 0.8,
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 50.0,
            child: TextFormField(
              textAlign: TextAlign.center,
              controller: _password,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please confirm your password";
                }
                return null;
              },
              obscureText: true,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: 'Enter your Password',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirm Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Opacity(
          opacity: 0.8,
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 50.0,
            child: TextFormField(
              textAlign: TextAlign.center,
              controller: _confirmPass,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please confirm your password";
                }
                if (value != _password.text)
                  return 'Password and confirmation password do not match.';
                return null;
              },
              obscureText: true,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: 'Confirm your Password',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
          }
          try {
            final newUser = await _auth.createUserWithEmailAndPassword(
                email: _email, password: _confirmPass.text);
            if (newUser != null) {
              print('Hoorey!');
            }
          } catch (e) {
            print(e);
          }
          print('new Sing up data submitted');
          print(_fName);
          print(_lName);
          print(_selectedPosition);
          print(_email);
          print(_password.text);
          print(_confirmPass.text);
          print(_selectedDate.toString());
          Navigator.pushNamed(context, InviteFriends.id);
        },
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
                  child: Form(
                    key: _formKey,
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
                        SizedBox(height: 10.0),
                        _buildFirstNameTF(),
                        SizedBox(height: 10.0),
                        _buildLastNameTF(),
                        SizedBox(height: 10.0),
                        _buildDateOfBirthTF(),
                        SizedBox(height: 10.0),
                        _buildPositionSelect(),
                        SizedBox(height: 10.0),
                        _buildEmailTF(),
                        SizedBox(height: 10.0),
                        _buildPasswordTF(),
                        SizedBox(height: 10.0),
                        _buildConfirmPasswordTF(),
                        SizedBox(height: 10.0),
                        _buildRegisterBtn(),
                      ],
                    ),
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
