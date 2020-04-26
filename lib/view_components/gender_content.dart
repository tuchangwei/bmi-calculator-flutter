import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/models/person_info.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderContent extends StatelessWidget {
  final Gender gender;
  GenderContent({@required this.gender});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        gender == Gender.male
            ? Icon(
                FontAwesomeIcons.mars,
                size: 80,
              )
            : Icon(
                FontAwesomeIcons.venus,
                size: 80,
              ),
        SizedBox(
          width: double.infinity,
          height: 15,
        ),
        gender == Gender.male
            ? Text(
                "MALE",
                style: kLargeButtonTextStyle,
              )
            : Text(
                "FEMALE",
                style: kLargeButtonTextStyle,
              ),
      ],
    );
  }
}
