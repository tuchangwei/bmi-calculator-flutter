import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  BottomButton({this.title, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: kLargeButtonTextStyle,
      ),
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 0),
      color: Color(0xFFEA1556),
    );
  }
}
