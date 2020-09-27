import 'package:flutter/material.dart';
import 'package:soccer_days/utilities/constants.dart';

Widget _buildPositionSelect() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'First Name',
        style: kLabelStyle,
      ),
      DropdownButton<String>(
          items: [
            DropdownMenuItem(
              child: Text('A'),
              value: 'A',
            ),
            DropdownMenuItem(
              child: Text('B'),
              value: 'B',
            ),
            DropdownMenuItem(
              child: Text('C'),
              value: 'C',
            ),
            DropdownMenuItem(
              child: Text('D'),
              value: 'D',
            ),
          ],
          onChanged: (value) {
            print(value);
          }),
    ],
  );
}
