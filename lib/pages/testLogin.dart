import 'package:flutter/material.dart';

Widget _buildBackArrow() {
  return SafeArea(
    child: Align(
      alignment: Alignment.topLeft,
      child: FlatButton(
        onPressed: () {},
        child: Icon(
          Icons.arrow_back_ios,
          size: 50.0,
        ),
      ),
    ),
  );
}
